#!/bin/bash


# Settup time zone
echo "***********************************************"
echo "Settup time zone"
echo "***********************************************"
timedatectl set-timezone Europe/Warsaw

# Update and install
echo "***********************************************"
echo "Update and install"
echo "***********************************************"

apt-get update
apt-get install -y git zip unzip nmap net-tools curl
apt-get install -y ca-certificates apt-transport-https
apt-get install -y mc htop





