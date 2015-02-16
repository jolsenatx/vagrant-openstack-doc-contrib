
git clone https://github.com/openstack/openstack-manuals.git /vagrant/openstack-manuals
cd /vagrant/openstack-manuals
sudo pip install -r test-requirements.txt
git review -s
git checkout master; git remote update; git pull origin master
git remote -v

