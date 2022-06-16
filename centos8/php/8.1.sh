#!/bin/sh
if [[ "$BASH_SOURCE" == "$0" ]]; then
    pwd=`pwd`
else
    pwd=`dirname $BASH_SOURCE`
fi

# epel 없으면 설치
epel=`dnf repolist epel`
if [[ ! -n $epel ]];then
    dnf install epel-release -y
fi

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module reset php -y
dnf module enable php:remi-8.1 -y
dnf install php php-mysqlnd php-fpm php-json php-pdo php-yaml php-xml php-zip -y


# config 덮어쓰기
config=$pwd/config.ini

cat $config > /etc/php.ini


systemctl enable php-fpm
systemctl restart php-fpm