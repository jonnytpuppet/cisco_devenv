#!/bin/sh
ssh -F files/vagrant.ssh-config n9kv1 'sudo rm -rf /nxos/tmp/*'
vagrant ssh-config n9kv1 > files/vagrant.ssh-config
cd cisco-nxapi
gem build cisco_nxapi.gemspec
scp -F ../files/vagrant.ssh-config *.gem n9kv1:/nxos/tmp
cd ../cisco-network-node-utils
gem build cisco_node_utils.gemspec
scp -F ../files/vagrant.ssh-config *.gem n9kv1:/nxos/tmp
cd ..
ssh -F files/vagrant.ssh-config n9kv1 'sudo ip netns exec management /opt/puppetlabs/puppet/bin/gem install /nxos/tmp/*.gem'
