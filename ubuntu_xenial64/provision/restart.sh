#!/bin/bash

# Restart
echo "***********************************************"
echo "Restart"
echo "***********************************************"

sudo /etc/init.d/mysql restart
sudo /etc/init.d/apache2 restart

fpm="/etc/init.d/php7.2-fpm"
if [ -f "$fpm" ]
then
	echo "$fpm found."
	sudo /etc/init.d/php7.2-fpm restart
else
	echo "$fpm not found."
fi