# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.network :forwarded_port, guest: 3306, host: 3306,
    auto_correct: true
  config.vm.provision "shell", inline:  "sudo /vagrant/install/mysql.sh"
end
