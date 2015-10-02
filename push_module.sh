#!/bin/sh

echo "WARNING: This copies the module to the switch's /etc/puppetlabs/code/modules directory for switch-local development. It may cause undefined behavior when editing code and using pluginsync from the master"
ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /nxos/tmp/*'
vagrant ssh-config n9kv1 > files/vagrant.ssh-config
scp -r -F files/vagrant.ssh-config cisco-network-puppet-module n9kv1:/nxos/tmp
ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /etc/puppetlabs/code/modules/cisco-network-puppet-module'
ssh -F files/vagrant.ssh-config n9kv1 'rm -rf /nxos/tmp/cisco-network-puppet-module/.git'
ssh -F files/vagrant.ssh-config n9kv1 'sudo mv /nxos/tmp/cisco-network-puppet-module /etc/puppetlabs/code/modules/'
