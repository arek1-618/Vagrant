#!/bin/bash

#OUT='/dev/tty'
#OUT='/dev/null'
OUT='/vagrant/apache_fastcgi.log'

echo "START" > $OUT

# Apache2
echo "***********************************************"
echo "Install Apache2"
echo "***********************************************"
apt-get update >> $OUT 2>&1
apt-get install -y apache2 >> $OUT 2>&1
apt-get install -y libapache2-mod-php7.2 >> $OUT 2>&1
apt-get install -y libapache2-mpm-itk >> $OUT 2>&1

cp /vagrant/config/apache_fastcgi/apache2/v_host1.conf /etc/apache2/sites-available/v_host1.conf
cp /vagrant/config/apache_fastcgi/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /vagrant/config/apache_fastcgi/apache2/ports.conf /etc/apache2/ports.conf

/etc/init.d/apache2 stop >> $OUT 2>&1

a2enmod mpm_itk >> $OUT 2>&1
a2dissite default-ssl.conf >> $OUT 2>&1
a2ensite v_host1.conf >> $OUT 2>&1

cp /vagrant/config/apache_fastcgi/index.php /var/www/html/index.php
rm /var/www/html/index.html
chown vagrant:vagrant /var/www/html/ -R


# FastCGI
echo "***********************************************"
echo "Install FastCGI"
echo "***********************************************"

apt install -y php7.2 php7.2-fpm php7.2-common >> $OUT 2>&1
cp /vagrant/config/apache_fastcgi/fpm/www.conf /etc/php/7.2/fpm/pool.d/www.conf
a2enmod actions fastcgi alias proxy_fcgi >> $OUT 2>&1

/etc/init.d/php7.2-fpm restart >> $OUT 2>&1
/etc/init.d/apache2 start >> $OUT 2>&1