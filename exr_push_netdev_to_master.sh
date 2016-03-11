#!/bin/sh

ssh -F files/switch.ssh-config master 'rm -rf /tmp/*'
scp -F files/switch.ssh-config -r netdev_stdlib master:/tmp
ssh -F files/switch.ssh-config master 'rm -rf /etc/puppetlabs/code/modules/netdev_stdlib'
ssh -F files/switch.ssh-config master 'rm -rf /tmp/netdev_stdlib/.git'
ssh -F files/switch.ssh-config master 'mv /tmp/netdev_stdlib /etc/puppetlabs/code/modules/'
