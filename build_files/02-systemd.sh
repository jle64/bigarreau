#!/usr/bin/env bash
# configure important system services

echo "::group::===========================> Configure system"

set -ouex pipefail

# system
systemctl enable \
    apparmor.service \
    bluetooth.service \
    cups-browsed.service \
    cups.socket \
    firewalld.service \
    greetd.service \
    NetworkManager.service \
    polkit.service \
    rechunker-group-fix.service \
    refresh-font-cache.service \
    tuned.service

# system-preset
systemctl preset \
    systemd-resolved.service

# mask incompatible services
systemctl mask systemd-remount-fs.service

# user
systemctl --global enable flathub-user.service 

# user-preset
systemctl preset --global flathub-user.service
