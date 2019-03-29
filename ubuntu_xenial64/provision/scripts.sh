#!/bin/bash

# Scripts
echo "***********************************************"
echo "Scripts"
echo "***********************************************"

rm -rf /home/vagrant/scripts/
mkdir /home/vagrant/scripts/

cp /vagrant/scripts/*.sh /home/vagrant/scripts/
cp /vagrant/provision/reload_db.sh /home/vagrant/scripts/reload_db.sh
cp /vagrant/provision/restart.sh /home/vagrant/scripts/restart.sh
cp /vagrant/provision/upgrade.sh /home/vagrant/scripts/upgrade.sh

sed -i -e 's/\r$//' /home/vagrant/scripts/*.sh
chown vagrant:vagrant -R /home/vagrant/scripts/
chmod +x /home/vagrant/scripts/*.sh