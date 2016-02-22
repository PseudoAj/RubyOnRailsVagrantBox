# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
PROJECT_NAME = "RubyOnRailsVagrantBox"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.define PROJECT_NAME, primary: true do |config|
    	config.vm.provider :virtualbox do |vb|
      		vb.name = PROJECT_NAME
    	end
    
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'RubyOnRailsVagrantBox'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.synced_folder ".", "/home/vagrant", type: "rsync", rsync_exclude: ".git/"

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
	end
end