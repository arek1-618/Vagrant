#!/bin/bash

#OUT='/dev/tty'
#OUT='/dev/null'
OUT='/vagrant/php.log'

echo "START" > $OUT

# PHP
PHP_VER="7.2"
echo "***********************************************"
echo "Install PHP: php"$PHP_VER
echo "***********************************************"


# Ubuntu 16.04
apt-get install -y software-properties-common >> $OUT 2>&1
add-apt-repository ppa:ondrej/php >> $OUT 2>&1
#----------------------------------------------------

apt-get update >> $OUT 2>&1

apt-get install -y php$PHP_VER  >> $OUT 2>&1
apt-get install -y php$PHP_VER-curl  >> $OUT 2>&1
apt-get install -y php$PHP_VER-mysql  >> $OUT 2>&1
apt-get install -y php$PHP_VER-cli  >> $OUT 2>&1
apt-get install -y php$PHP_VER-intl  >> $OUT 2>&1
apt-get install -y php$PHP_VER-fpm  >> $OUT 2>&1
apt-get install -y php$PHP_VER-curl  >> $OUT 2>&1
apt-get install -y php$PHP_VER-gd  >> $OUT 2>&1
apt-get install -y php$PHP_VER-json  >> $OUT 2>&1
apt-get install -y php$PHP_VER-mbstring  >> $OUT 2>&1
apt-get install -y php$PHP_VER-imap  >> $OUT 2>&1
apt-get install -y php$PHP_VER-xml  >> $OUT 2>&1
apt-get install -y php$PHP_VER-zip  >> $OUT 2>&1
apt-get install -y php$PHP_VER-soap  >> $OUT 2>&1
apt-get install -y php$PHP_VER-ldap  >> $OUT 2>&1
apt-get install -y php$PHP_VER-apcu >> $OUT 2>&1
apt-get install -y php$PHP_VER-bcmath >> $OUT 2>&1


cp /vagrant/config/php/php.ini /etc/php/$PHP_VER/apache2/php.ini