#!/bin/sh

ssh -F files/switch.ssh-config vmp 'rm -rf /tmp/*'
scp -F files/switch.ssh-config -r netdev_stdlib vmp:/tmp
ssh -F files/switch.ssh-config vmp 'rm -rf /etc/puppetlabs/code/modules/netdev_stdlib'
ssh -F files/switch.ssh-config vmp 'rm -rf /tmp/netdev_stdlib/.git'
ssh -F files/switch.ssh-config vmp 'mv /tmp/netdev_stdlib /etc/puppetlabs/code/modules'
