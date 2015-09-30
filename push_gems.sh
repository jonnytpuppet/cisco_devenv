#!/bin/sh

vagrant ssh-config n9kv1 > files/vagrant.ssh-config
cd cisco-nxapi
gem build cisco_nxapi.gemspec
scp -F ../files/vagrant.ssh-config *.gem n9kv1:/var/home/vagrant
cd ../cisco-network-node-utils
gem build cisco_node_utils.gemspec
scp -F ../files/vagrant.ssh-config *.gem n9kv1:/var/home/vagrant
cd ..
ssh -F files/vagrant.ssh-config n9kv1 'sudo ip netns exec management /opt/puppetlabs/puppet/bin/gem install *.gem'
