# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

repos = (ENV['repos_dir'].nil?) ? "none" : ENV['repos_dir']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "mysql" do |mysql|
    mysql.vm.box = "ubuntu/wily64"
    mysql.vm.network :forwarded_port, guest: 3306, host: 3306,
      auto_correct: true
    mysql.vm.provision "shell", inline:  "sudo /vagrant/install/mysql.sh"
  end

  config.vm.define "ruby" do |ruby|
    usage = "Usage: repos_dir='<dir>' vagrant up ruby"
    abort(usage) if (repos == 'none' && ARGV[0] == "up")
    ruby.vm.synced_folder repos, "/repos" if (ARGV[0] == "up")
    ruby.vm.synced_folder "~/.ssh", "/home/vagrant/ssh"
    ruby.vm.box = "leopard/rwprecise64"
    ruby.vm.provision "shell", inline:  "sudo /vagrant/install/ruby.sh"
  end

end
