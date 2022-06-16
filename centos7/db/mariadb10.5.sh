#!/bin/sh


# 레포지토리 추가
cat << EOF > /etc/yum.repos.d/mariadb.repo
# MariaDB 10.5 CentOS repository list - created 2021-03-22 07:20 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos7-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF
dnf install MariaDB-server MariaDB -y


systmectl enable mariadb
systmectl restart mariadb