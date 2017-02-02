#!/bin/bash

command -v ansible-playbook >/dev/null 2>&1 || { echo >&2 "I require "ansible-playbook" but it's not installed.  Aborting."; exit 1; }

# Uncomment just in case you need to create bridges and dummy interfaces
# ansible-playbook _bridges.yml 

## Here we go!
echo "$(date -R) Here we go!"
# Start creating your servers
cd ..
echo "$(date -R) Start creating your servers"
ansible-playbook -i hosts nuage-install.yml

# Configure your DNS, NTP and DHCP server
sleep 150 # Wait for server to come online
ssh-keyscan -t rsa 10.10.10.2 | sed -e 's/#.*$//' | sed -e '/^$/d' >> ~/.ssh/known_hosts  # Adding nserver to known_hosts
echo "$(date -R) Configuring nserver"
ansible-playbook -i hosts nserver-deploy.yml

# Finish installation in  your VSD  server
ssh-keyscan -t rsa 10.10.10.10 | sed -e 's/#.*$//' | sed -e '/^$/d' >> ~/.ssh/known_hosts  # Adding nserver to known_hosts
echo "$(date -R) finishing installation of VSD"
ansible-playbook -i hosts nuage-deploy.yml 

echo "$(date -R) Listo! ahora juegue!" 
