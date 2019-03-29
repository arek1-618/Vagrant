#!/bin/bash

# NodeJs
echo "***********************************************"
echo "Install NodeJs"
echo "***********************************************"
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
apt-get install -y nodejs

# Composer
echo "***********************************************"
echo "Install Composer"
echo "***********************************************"

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer


# Yarn
echo "***********************************************"
echo "Install Yarn"
echo "***********************************************"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install yarn -y


# Show Info
echo "------------------------------------------------"
echo "PHP"
php -v
echo "------------------------------------------------"
echo "node"
node -v
echo "------------------------------------------------"
echo "composer"
composer -V
echo "------------------------------------------------"
echo "yarn"
yarn -v


