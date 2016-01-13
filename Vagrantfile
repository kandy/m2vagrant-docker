# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v|
        v.name = "php7.dev"
        v.cpus = 2
        v.memory = 1024 * 2 #GB
    end

    config.vm.box = "ubuntu/trusty64"
    
    config.vm.network :private_network, ip: "192.168.33.99"
    config.ssh.forward_agent = true
    
    if Vagrant::Util::Platform.windows?
        config.vm.synced_folder "./", "/vagrant", type: "smb", mount_options: ['dmode=777', 'fmode=777']
    else
        config.vm.synced_folder "./", "/vagrant", type: "nfs", mount_options: [ 'rw', 'vers=3', 'tcp', 'fsc']
    end 

    config.vm.provision "shell", path: "getdocker.sh"

    config.vm.provision "docker" do |d|
        d.run "php-fpm",
          image: "php:7.0.2-fpm",
          args: "-v '/vagrant:/vagrant'"
    end
end
