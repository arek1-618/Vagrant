#!/bin/bash
systemctl restart apache2.service
systemctl restart mysql.service
/etc/init.d/php7.2-fpm restart
