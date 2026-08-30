#!/usr/bin/env bash
# extra important stuff

set -ouex pipefail

# configure useradd defaults
sed -i 's|^HOME=.*|HOME=/var/home|' "/etc/default/useradd"

# remove any .pacnew files
find /etc/ -name "*.pacnew" -type f -delete

# pick random gender flag and set it as default face
cp "/usr/share/tartaria/faces/face-$(shuf -i 1-10 -n 1).png" /usr/share/tartaria/faces/default-face.png

# apply gschema overrides
glib-compile-schemas /usr/share/glib-2.0/schemas

# move /opt into /usr so it gets preserved
rm -rf /usr/opt
mv /opt /usr

echo "::endgroup::"
