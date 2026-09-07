image_name := env("BUILD_IMAGE_NAME", "bigarreau")
image_tag := env("BUILD_IMAGE_TAG", "latest")
base_dir := env("BUILD_BASE_DIR", ".")
filesystem := env("BUILD_FILESYSTEM", "btrfs")

build-containerfile $image_name=image_name:
    podman build --skip-unused-stages=false --volume "$PWD":/src -f Containerfile -t "{{image_name}}:{{image_tag}}" .

build-iso $image_name=image_name $image_tag=image_tag: (build-containerfile image_name)
    #!/usr/bin/env bash
    set -ouex pipefail
    if [ ! -d .iso-builder ] ; then
        git clone https://github.com/tartaria-dev/iso-builder.git .iso-builder
        git -C .iso-builder checkout 786cc8f014f885287aae371ce7dffc2f08a27be1
    fi
    sudo env "PATH=$PATH" ./.iso-builder/start.sh "{{image_name}}:{{image_tag}}" ./out bigarreau

bootc *ARGS:
    podman run \
        --rm --privileged --pid=host \
        -it \
        -v /sys/fs/selinux:/sys/fs/selinux \
        -v /etc/containers:/etc/containers:Z \
        -v /var/lib/containers:/var/lib/containers:Z \
        -v /dev:/dev \
        -e RUST_LOG=debug \
        -v "{{base_dir}}:/data" \
        --security-opt label=type:unconfined_t \
        "{{image_name}}:{{image_tag}}" bootc {{ARGS}}

generate-bootable-image $base_dir=base_dir $filesystem=filesystem:
    #!/usr/bin/env bash
    if [ ! -e "${base_dir}/bootable.img" ] ; then
        fallocate -l 50G "${base_dir}/bootable.img"
    fi
    just bootc install to-disk --composefs-backend --via-loopback /data/bootable.img --filesystem "${filesystem}" --wipe --bootloader systemd
