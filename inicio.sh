#!/bin/bash

# ssh-keyscan -t rsa 192.168.1.113 | sed -e 's/#.*$//' | sed -e '/^$/d' >> ~/.ssh/known_hosts  # Adding hypervisor to known_hosts

# Uncomment just in case you need to create bridges and dummy interfaces
# ansible-playbook _bridges.yml 

## Here we go!
echo "$(date) Here we go!"
# Start creating your servers
echo "$(date) Start creating your servers"
ansible-playbook -i hosts nuage-install.yml

# Configure your DNS, NTP and DHCP server
sleep 150 # Wait for server to come online
ssh-keyscan -t rsa 10.10.10.2 | sed -e 's/#.*$//' | sed -e '/^$/d' >> ~/.ssh/known_hosts  # Adding nserver to known_hosts
echo "$(date) Configuring nserver"
ansible-playbook -i hosts nserver-deploy.yml

# Finish installation in  your VSD  server
ssh-keyscan -t rsa 10.10.10.10 | sed -e 's/#.*$//' | sed -e '/^$/d' >> ~/.ssh/known_hosts  # Adding vsd to known_hosts
echo "$(date) finishing installation of VSD"
ansible-playbook -i hosts nuage-deploy.yml 

echo "$(date) Listo! ahora juegue!" 
