#!/bin/sh


# repo 따로 추가할라면 yum 하던대로

dnf install epel-release -y
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module reset php -y
dnf module enable php:remi-7.4 -y
dnf install git nginx php php-mysqlnd php-fpm php-json php-pdo -y

dnf install php-pecl-mongodb php-pecl-redis -y

# redis 5버전 현재최신 6버전
dnf install redis

# http://download.redis.io/releases/

# 몽고디비 4.4.2버전
rpm -ivh https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.1-1.el8.x86_64.rpm
rpm -ivh https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-shell-4.4.1-1.el8.x86_64.rpm





#yum=`which yum`

#${yum} install epel-release -y
#${yum} install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
#${yum} install git nginx php php-mysqlnd php-fpm php-json php-pdo -y



