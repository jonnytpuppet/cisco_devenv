#!/bin/sh

ssh -F files/switch.ssh-config vmp 'rm -rf /tmp/*'
scp -F files/switch.ssh-config -r cisco-network-puppet-module vmp:/tmp
ssh -F files/switch.ssh-config vmp 'rm -rf /etc/puppetlabs/code/modules/cisco-network-puppet-module'
ssh -F files/switch.ssh-config vmp 'mv /tmp/cisco-network-puppet-module /etc/puppetlabs/code/modules'
