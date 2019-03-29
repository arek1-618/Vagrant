#!/bin/bash


#OUT='/dev/tty'
#OUT='/dev/null'
OUT='/vagrant/mysql.log'

echo "START" > $OUT

# MySQL
echo "***********************************************"
echo "Install MySQL"
echo "***********************************************"

apt-get update >> $OUT 2>&1
apt-get install -y debconf-utils >> $OUT 2>&1
debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234" >> $OUT 2>&1
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234" >> $OUT 2>&1
apt-get install -y mysql-server mysql-client >> $OUT 2>&1
mysqladmin -u root -p'1234' password '' >> $OUT 2>&1

cp /vagrant/config/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

/etc/init.d/mysql restart >> $OUT 2>&1

sudo mysql -u root < "/vagrant/config/mysql/sql.sql"
