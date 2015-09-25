Vagrant.configure(2) do |config|
  config.vm.define "master" do |master|
    master.vm.box = "puppetlabs/centos-7.0-64-nocm"
    master.vm.network "private_network", ip: "192.168.1.3", virtualbox_intnet: "nxosv_network1"
    master.vm.provision "shell", inline: "sudo /vagrant/master_provision.sh"
  end
  config.vm.define "n9kv1" do |n9kv1|
    n9kv1.vm.box = "n9kv"
    n9kv1.ssh.insert_key = false
    n9kv1.vm.boot_timeout = 420
    n9kv1.vm.synced_folder '.', '/vagrant', disabled: true
    n9kv1.vm.network "private_network", ip: "192.168.1.2", auto_config: false, virtualbox__intnet: "nxosv_network1"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network2"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network3"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network4"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network5"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network6"
    n9kv1.vm.network "private_network", auto_config: false, virtualbox__intnet: "nxosv_network7"
    n9kv1.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm',:id,'--nicpromisc2','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc3','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc4','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc5','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc6','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc7','allow-all']
      vb.customize ['modifyvm',:id,'--nicpromisc8','allow-all']
    end
    n9kv1.vm.provision "shell", inline: "sudo ip netns exec management echo 'nameserver 8.8.8.8\ndomain puppetlabs.net' > /etc/resolv.conf"
    n9kv1.vm.provision "shell", inline: "sudo ip netns exec management yum install -y http://yum.puppetlabs.com/puppetlabs-release-pc1-cisco-wrlinux-5.noarch.rpm"
    n9kv1.vm.provision "shell", inline: "sudo ip netns exec management yum install -y puppet-agent"
    n9kv1.vm.provision "shell", inline: "sudo ip netns exec management echo '192.168.1.3 puppet pe-puppet pe-puppet.localdomain' >> /etc/hosts"
  end
end

