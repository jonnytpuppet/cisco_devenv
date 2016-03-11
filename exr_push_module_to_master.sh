#!/bin/sh

ssh -F files/switch.ssh-config master 'rm -rf /tmp/*'
scp -F files/switch.ssh-config -r cisco-network-puppet-module master:/tmp
ssh -F files/switch.ssh-config master 'rm -rf /etc/puppetlabs/code/modules/cisco-network-puppet-module'
ssh -F files/switch.ssh-config master 'mv /tmp/cisco-network-puppet-module /tmp/cisco'
ssh -F files/switch.ssh-config master 'mv /tmp/cisco /etc/puppetlabs/code/modules/'
