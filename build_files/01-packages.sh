#!/usr/bin/env bash
# commands for installing main arch packages

echo "::group::===========================> Install packages"

set -ouex pipefail

declare -a packages=(
    # ========> system
    apparmor
    base
    bootc/bootc
    bootupd
    cpio
    dbus
    dbus-glib
    dracut
    efibootmgr
    linux-cachyos
    linux-cachyos-nvidia-open
    linux-firmware
    ostree
    scx-manager
    scx-scheds
    shadow
    shim
    skopeo
    udev

    # ========> cli
    bash
    bash-completion
    bat
    binutils
    curl
    fd
    fish
    gcc
    git
    glibc-locales
    jq
    less
    man-db
    man-pages
    man-pages-utils
    neovim
    nix
    openssh
    python3
    ripgrep
    tar
    tree
    unzip
    wget

    # ========> diag
    atop
    bpftrace
    htop
    lsof
    ltrace
    ncdu
    powertop
    strace
    sysstat

    # ========> filesystems
    btrfs-progs
    dosfstools
    e2fsprogs
    erofs-utils
    exfatprogs
    f2fs-tools
    gpart
    gparted
    jfsutils
    mkosi
    mtools
    nilfs-utils
    ntfs-3g
    parted
    sshfs
    udftools
    udisks2
    xfsprogs

    # ========> hardware
    acpid
    amd-ucode
    bluez
    bluez-utils
    ddcutil
    intel-media-driver
    intel-ucode
    iio-sensor-proxy
    lm_sensors
    libva-intel-driver
    libva-mesa-driver
    usb_modeswitch
    vpl-gpu-rt
    vulkan-icd-loader
    xf86-video-amdgpu
    zram-generator

    # ========> printing
    cups
    cups-browsed

    # ========> display & graphics
    brightnessctl
    mesa-utils
    sunshine
    switcheroo-control
    wayland-utils
    waypipe
    xwayland-satellite

    # ========> audio
    alsa-firmware
    linux-firmware-intel
    pipewire
    pipewire-audio
    pipewire-ffado
    pipewire-libcamera
    pipewire-pulse
    pipewire-zeroconf
    sof-firmware
    wireplumber

    # ========> network
    doggo
    firewalld
    inetutils
    libmtp
    mtr
    networkmanager
    nss-mdns
    opensnitch
    samba
    smbclient
    systemd-resolvconf
    wireguard-tools

    # ========> containers
    distrobox
    flatpak
    fuse-overlayfs
    podman
    podman-compose

    # ========> media
    ffmpeg
    ffmpegthumbs
    ffmpegthumbnailer
    gst-libav
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-good
    gst-plugins-ugly
    libglvnd
    librsvg
    mpv-mpris
    playerctl

    # ========> fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    unicode-emoji

    # ========> interface
    accountsservice
    cliphist
    glycin
    greetd
    greetd-tuigreet
    libappindicator
    niri
    noctalia
    orca
    oo7
    shared-mime-info
    tuned
    wlsunset
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-user-dirs
    xdg-utils
    zenity

    # ========> applications
    bazaar
    file-roller
    gnome-text-editor
    gpu-screen-recorder
    kdeconnect
    kitty
    nautilus
)

pacman -S --needed --noconfirm "${packages[@]}"
