# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision "file", source: "id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "file", source: "known_hosts.txt", destination: "/home/vagrant/.ssh/known_hosts"
  config.vm.provision "file", source: "gitconfig.txt", destination: "/home/vagrant/.gitconfig"
  config.vm.provision :shell do |shell|
    shell.inline = "apt-get update && apt-get -y install maven git git-review python-pip libxml2-dev libxslt1-dev python-dev gcc gettext zlib1g-dev && pip install git-review tox"
  end
  config.vm.provision :shell do |shell|
    shell.privileged = false
    shell.inline = "/vagrant/systemprep.sh"
  end
end


