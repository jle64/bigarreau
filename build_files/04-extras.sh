#!/usr/bin/env bash
# extra important stuff

set -ouex pipefail

# configure useradd defaults
sed -i 's|^HOME=.*|HOME=/var/home|' "/etc/default/useradd"

# set plymouth theme
sed -i 's/bgrt/red_loader/g' /usr/share/plymouth/plymouthd.defaults

# remove any .pacnew files
find /etc/ -name "*.pacnew" -type f -delete

# pick random gender flag and set it as default face
cp "/usr/share/tartaria/faces/face-$(shuf -i 1-10 -n 1).png" /usr/share/tartaria/faces/default-face.png

# install default icon theme
git clone https://github.com/vinceliuice/MacTahoe-icon-theme
cd MacTahoe-icon-theme
bash ./install.sh -t grey -n default-icons -d /usr/share/icons
cd ..
rm -rf MacTahoe-icon-theme

# apply gschema overrides
glib-compile-schemas /usr/share/glib-2.0/schemas

# move /opt into /usr so it gets preserved
rm -rf /usr/opt
mv /opt /usr

echo "::endgroup::"
