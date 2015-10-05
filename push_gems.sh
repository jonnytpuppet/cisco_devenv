#!/bin/sh
ssh -F files/switch.ssh-config n9kv1 'sudo rm -rf /nxos/tmp/*'
cd cisco-nxapi
gem build cisco_nxapi.gemspec
scp -F ../files/switch.ssh-config *.gem n9kv1:/nxos/tmp
cd ../cisco-network-node-utils
gem build cisco_node_utils.gemspec
scp -F ../files/switch.ssh-config *.gem n9kv1:/nxos/tmp
cd ..
ssh -F files/switch.ssh-config n9kv1 'sudo ip netns exec management /opt/puppetlabs/puppet/bin/gem install /nxos/tmp/cisco_nxapi*.gem /nxos/tmp/cisco_node_utils*.gem'
