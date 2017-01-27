#Create a Nuage VCS in a KVM Box

Hello there. Bored to create and recreate many times a dns/ntp/dhcp server for my demos. I've created this playbook
It would create a libvirt VM and set bind, ntp and dhcp up.

A quick start is:

```
curl http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2 > /tmp/centos7.qcow2
ansible-playbook build.yml
ansible-playbook -i hosts dom-create.yml
```

Wait fot the server to start up and then test your ssh connection.
Now you can excecute:

```
ansible-playbook -i hosts nserver-deploy.yml
```

##Configuration

All the vars are in build.yml to create the server. And use nserver-deploy.yml for the services.
Check the vars before to proceed.


##Remove everything

```
ansible-playbook -i hosts dom-reset.yml
ansible-playbook build-reset.yml
```

Have fun!
