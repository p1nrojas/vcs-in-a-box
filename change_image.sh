#!/bin/bash -
 set -e
 guestname="$1"
 
 guestfish -d "$guestname" -i << 'EOF'
   write /etc/motd "
   Welcome to Acme Incorporated.
   Just proving more than on line"
   chmod 0644 /etc/motd
 EOF
