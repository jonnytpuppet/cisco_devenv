#!/bin/sh

echo "WARNING: This copies the module to the switch's /etc/puppetlabs/code/modules directory for switch-local development. It may cause undefined behavior when editing code and using pluginsync from the master"
vagrant ssh-config n9kv1 > files/vagrant.ssh-config
scp -r -F files/vagrant.ssh-config cisco-network-puppet-module n9kv1:~
ssh -F files/vagrant.ssh-config n9kv1 'sudo mv cisco-network-puppet-module /etc/puppetlabs/code/modules'
