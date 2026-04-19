#!/usr/bin/env bash
# commands for installing main arch packages

echo "::group::===========================> Install packages"

set -ouex pipefail

declare -a packages=(
    # ========> system
    base
    bootc/uupd
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
    inetutils
    jq
    less
    lsof
    lurk
    man-db
    man-pages
    man-pages-utils
    neovim
    nix
    openssh
    powertop
    python3
    sudo
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
    xfsprogs

    # ========> hardware
    acpid
    amd-ucode
    apparmor
    bluez
    bluez-utils
    cups
    cups-browsed
    ddcutil
    intel-media-driver
    intel-ucode
    iio-sensor-proxy
    lm_sensors
    libva-intel-driver
    libva-mesa-driver
    vpl-gpu-rt
    vulkan-icd-loader
    vulkan-intel
    vulkan-radeon
    xf86-video-amdgpu
    zram-generator

    # ========> display & graphics
    mesa
    mesa-utils
    wayland-utils
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
    libmtp
    networkmanager
    nss-mdns
    samba
    smbclient
    tailscale
    udisks2

    # ========> containers
    distrobox
    flatpak
    podman
    podman-compose

    # ========> media
    ffmpeg
    ffmpegthumbs
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
    chaotic-aur/bibata-cursor-theme
    chaotic-aur/darkly-qt6-git
    chaotic-aur/matugen-git
    chaotic-aur/noctalia-shell
    chaotic-aur/opentabletdriver
    cliphist
    evolution-data-server
    glycin
    gnome-keyring
    greetd
    greetd-agreety
    greetd-tuigreet
    libappindicator
    niri
    orca
    orchis-theme
    polkit-gnome
    shared-mime-info
    tuned
    tuned-ppd
    wlsunset
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-user-dirs
    xdg-utils

    # ========> gpu
    switcheroo
    switcheroo-control

    # ========> applications
    chaotic-aur/bazaar-git
    chaotic-aur/distroshelf
    chaotic-aur/valent-git
    cachyos/scx-manager
    cachyos/scx-scheds
    file-roller
    gnome-text-editor
    gpu-screen-recorder
    kitty
    mission-center
    nautilus
    sysprof
)

pacman -Sy --noconfirm "${packages[@]}" >/dev/null
