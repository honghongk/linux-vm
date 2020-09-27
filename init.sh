#!/bin/sh


dnf install epel-release -y
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module reset php -y
dnf module enable php:remi-7.4 -y
dnf install git nginx php php-mysqlnd php-fpm php-json php-pdo -y

dnf install php-pecl-mongodb php-pecl-redis -y







#yum=`which yum`

#${yum} install epel-release -y
#${yum} install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
#${yum} install git nginx php php-mysqlnd php-fpm php-json php-pdo -y



