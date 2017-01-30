guestfish -a /tmp/vsd40r61.qcow2 -i ln-sf /dev/null /etc/systemd/system/NetworkManager.service
guestfish -a /tmp/vsd40r61.qcow2 -i ln-sf /dev/null /etc/systemd/system/NetworkManager-dispatcher.service
guestfish -a /tmp/vsd40r61.qcow2 -i ln-sf /dev/null /etc/systemd/system/NetworkManager-wait-online.service

# Removed symlink /etc/systemd/system/multi-user.target.wants/NetworkManager.service.
# Removed symlink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service.
# Removed symlink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service.
