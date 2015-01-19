# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    print '[', Vagrant::Util::Platform.windows? ? 'win' : 'no-win', ']'

    config.vm.provider :virtualbox do |v|
        v.name = "mage2.dev"
        v.cpus = 2
        v.memory = 1024
    end

    config.vm.box = "ubuntu/trusty64"
    
    config.vm.network :private_network, ip: "192.168.33.99"
    config.ssh.forward_agent = true

    #############################################################
    # Ansible provisioning (you need to have ansible installed)
    #############################################################

    
    if File.executable?('ansible-playbook')
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
        end
    else
        config.vm.provision :shell, path: "ansible/windows.sh"
    end

    if Vagrant::Util::Platform.windows?
	config.vm.synced_folder "./", "/vagrant", type: "smb"
    else
	config.vm.synced_folder "./", "/vagrant", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp', 'fsc']
    end
end
