#!/bin/bash
#need sudo
sudo apt-get update

#------------- Install Apache2 START -------------
#install apache2
apt install apache2
a2enmod rewrite
a2dismod mpm_event
a2enmod mpm_prefork
#------------- Install Apache2 END -------------


#------------- Install MySQL START -------------
#install mysql server
apt install mysql-server
#------------- Install MySQL END -------------



#------------- Install PHP7.0 START -------------
#install PHP7.0
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi php7.0-cli php7.0-soap php7.0-curl
service apache2 restart 
#------------- Install PHP7.0 END -------------


#------------- Install PhpMyAdmin START -------------
#install PHP5.6
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install php5.6 php5.6-mysql php5.6-mbstring php5.6-mcrypt php5.6-cgi php5.6-mysql php5.6-xml php5.6-intl php5.6-mbstring php5.6-json php5.6-cli php5.6-gd php5.6-curl php5.6-sqlite3 php5.6-soap libapache2-mod-php5.6
#------------- Install PhpMyAdmin END -------------


#------------- Install PhpMyAdmin START -------------
#install PhpMyAdmin
apt-get install phpmyadmin php-mbstring php-gettext
phpenmod mcrypt
phpenmod mbstring
#------------- install PhpMyAdmin END -------------


#------------- Install xDebug START -------------
apt-get install php-xdebug

# xDebug configs for PHP 7.0 on ubuntu 16.04
xdebug_config=' 
;xdebug configs
zend_extension="/usr/lib/php/20160303/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.remote_host=127.0.0.1
xdebug.idekey=PHPSTORM
 '
#for apache2
echo "$xdebug_config" > /etc/php/7.0/apache2/php.ini
#for cli
echo "$xdebug_config" > /etc/php/7.0/cli/php.ini

# xDebug configs for PHP 5.6 on ubuntu 16.04
xdebug_config=' 
;xdebug configs
zend_extension="/usr/lib/php/20131226/xdebug.so"
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.remote_host=127.0.0.1
xdebug.idekey=PHPSTORM
 '
#for apache2
echo "$xdebug_config" > /etc/php/5.6/apache2/php.ini
#for cli
echo "$xdebug_config" > /etc/php/5.6/cli/php.ini
#------------- install xDebug END -------------


service apache2 restart 