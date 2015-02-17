# -*- mode: ruby -*-
# vi: set ft=ruby :
## Provisioning script
$script = <<SCRIPT
echo "Cloning Manuals. May take a while..."
git clone https://github.com/openstack/openstack-manuals.git /vagrant/openstack-manuals
cd /vagrant/openstack-manuals
sudo pip install -r test-requirements.txt
git review -s
git checkout master; git remote update; git pull origin master
git remote -v
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "file", source: "id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
  config.vm.provision "file", source: "known_hosts.txt", destination: "/home/vagrant/.ssh/known_hosts"
  config.vm.provision "file", source: "gitconfig.txt", destination: "/home/vagrant/.gitconfig"
  config.vm.provision "shell",
    inline: "apt-get update && apt-get -y install maven git git-review python-pip libxml2-dev libxslt1-dev python-dev gcc gettext zlib1g-dev && pip install git-review tox"
  config.vm.provision "shell", inline: $script
end
