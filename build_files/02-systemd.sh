#!/usr/bin/env bash
# configure important system services

echo "::group::===========================> Configure system"

set -ouex pipefail

# system
systemctl disable \
    getty@.service
systemctl enable \
    apparmor.service \
    bluetooth.service \
    cups-browsed.service \
    cups.socket \
    firewalld.service \
    kmsconvt@.service \
    greetd.service \
    NetworkManager.service \
    polkit.service \
    rechunker-group-fix.service \
    refresh-font-cache.service \
    tuned-ppd.service \
    tuned.service \
    uupd.timer

# system-preset
systemctl preset \
    systemd-resolved.service

# user
systemctl --global enable \
    flathub-user.service \
    noctalia-shell.service \
    opentabletdriver.service
    
# user-preset
systemctl preset --global \
    flathub-user.service \
    noctalia-shell.service

# user-wants for Niri
systemctl add-wants --global niri.service \
    noctalia-shell.service
