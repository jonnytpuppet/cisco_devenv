#!/bin/sh
ssh -F files/switch.ssh-config vmp 'rm -rf /tmp/*'
cd cisco-network-node-utils
gem build cisco_node_utils.gemspec
scp -F ../files/switch.ssh-config *.gem vmp:/tmp
cd ..
scp -F files/switch.ssh-config *.gem vmp:/tmp
ssh -F files/switch.ssh-config vmp '/opt/puppetlabs/puppet/bin/gem install /tmp/google*.gem /tmp/grpc*.gem /tmp/cisco_node_utils*.gem'
