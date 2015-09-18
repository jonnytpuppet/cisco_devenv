#!/bin/sh

if ! `grep puppet /etc/hosts` ; then
  echo >> /etc/hosts <<EOF
127.0.0.1 puppet pe-puppet pe-puppet.localdomain
EOF
fi
if ! [ -f /vagrant/files/puppet-enterprise-2015.2.1-el-7-x86_64.tar ] ; then
  curl http://enterprise.delivery.puppetlabs.net/2015.2/ci-ready/puppet-enterprise-2015.2.1-el-7-x86_64.tar > /vagrant/files/puppet-enterprise-2015.2.1-el-7-x86_64.tar
fi
if ! [ -d $HOME/puppet-enterprise-2015.2.1-el-7-x86_64 ] ; then
  tar xvf /vagrant/files/puppet-enterprise-2015.2.1-el-7-x86_64.tar -C $HOME
fi
if ! [ -d /opt/puppetlabs ] ; then
  $HOME/puppet-enterprise-2015.2.1-el-7-x86_64/puppet-enterprise-installer -a $HOME/puppet-enterprise-2015.2.1-el-7-x86_64/answers/all-in-one.answers.txt
fi
