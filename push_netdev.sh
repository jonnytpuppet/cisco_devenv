#!/bin/sh

vagrant ssh-config n9kv1 > files/vagrant.ssh-config
scp -r -F files/vagrant.ssh-config netdev_stdlib n9kv1:~
ssh -F files/vagrant.ssh-config n9kv1 'sudo mv netdev_stdlib /etc/puppetlabs/code/modules'
