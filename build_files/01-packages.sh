#!/usr/bin/env bash
# commands for installing main arch packages

echo "::group::===========================> Install packages"

set -ouex pipefail

declare -a packages=(
    # ========> system
    base
    cachyos/linux-cachyos-nvidia-open
    chaotic-aur/bootc
    cpio
    dbus
    dbus-glib
    dracut
    efibootmgr
    linux-firmware
    ostree
    shadow
    shim
    skopeo
    udev

    # ========> cli
    bash
    bash-completion
    binutils
    curl
    fish
    gcc
    git
    glibc-locales
    jq
    less
    lsof
    man-db
    man-pages
    man-pages-utils
    neovim
    nix
    openssh
    powertop
    python3
    strace
    tar
    unzip
    wget

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
    udftools
    udisks2
    xfsprogs

    # ========> hardware
    acpid
    amd-ucode
    apparmor
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
    vulkan-intel
    vulkan-radeon
    xf86-video-amdgpu
    zram-generator

    # ========> printing
    ghostscript
    cups
    cups-browsed

    # ========> display & graphics
    mesa
    mesa-utils
    sunshine
    switcheroo-control
    wayland-utils
    waypipe
    wayvr-git
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
    firewalld
    inetutils
    libmtp
    networkmanager
    nss-mdns
    samba
    smbclient
    systemd-resolvconf
    wireguard-tools

    # ========> containers
    distrobox
    flatpak
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
    plymouth

    # ========> fonts
    gnu-free-fonts
    gsfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    ttf-arphic-uming
    ttf-baekmuk
    ttf-croscore
    ttf-dejavu
    ttf-droid
    ttf-ibm-plex
    ttf-overpass
    unicode-emoji
    wqy-microhei

    # ========> interface
    accountsservice
    archlinux-xdg-menu
    brightnessctl
    cliphist
    evolution-data-server
    glycin
    gnome-keyring
    greetd
    greetd-tuigreet
    libappindicator
    niri
    orca
    shared-mime-info
    tuned
    wlsunset
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-user-dirs
    xdg-utils

    # ========> applications
    bazaar
    chaotic-aur/valent-git
    cachyos/scx-manager
    cachyos/scx-scheds
    file-roller
    gnome-text-editor
    gpu-screen-recorder
    kitty
    nautilus
)

pacman -Sy --noconfirm "${packages[@]}" >/dev/null
