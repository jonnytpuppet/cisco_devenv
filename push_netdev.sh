#!/bin/sh

ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /nxos/tmp/*'
vagrant ssh-config n9kv1 > files/vagrant.ssh-config
scp -r -F files/vagrant.ssh-config netdev_stdlib n9kv1:/nxos/tmp
ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /etc/puppetlabs/code/modules/netdev_stdlib'
ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /nxos/tmp/netdev_stdlib/.git'
ssh -F files/vagrant.ssh-config n9kv1 'sudo mv /nxos/tmp/netdev_stdlib /etc/puppetlabs/code/modules'
