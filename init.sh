#!/bin/sh

# repo 따로 추가할라면 yum 하던대로
dnf update -y

dnf install epel-release -y
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module reset php -y
dnf module enable php:remi-8.0 -y
dnf install git wget nginx php php-mysqlnd php-fpm php-json php-pdo php-yaml -y
dnf install certbot -y

# 리눅스 한글 언어팩 추가
dnf install glibc-langpack-ko -y


cat << EOF > /etc/yum.repos.d/mariadb.repo
# MariaDB 10.5 CentOS repository list - created 2021-03-22 07:20 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.5/centos8-amd64
module_hotfixes=1
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF



dnf install MariaDB-server MariaDB -y
#dnf install redis
#dnf install php-pecl-mongodb php-pecl-redis -y



# 세팅
timedatectl set-timezone Asia/Seoul
localectl set-locale LANG=ko_KR.utf8

setenforce 0
cat << EOF > /etc/ssh/sshd_config
Port 8025
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
SyslogFacility AUTHPRIV
PermitRootLogin yes
AuthorizedKeysFile      .ssh/authorized_keys
PasswordAuthentication yes
ChallengeResponseAuthentication no
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
UsePAM yes
X11Forwarding yes
PrintMotd no
ClientAliveInterval 420
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS
Subsystem       sftp    /usr/libexec/openssh/sftp-server
EOF

cat << EOF > /etc/chrony.conf
server time.bora.net iburst
server metadata.google.internal iburst
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
keyfile /etc/chrony.keys
leapsectz right/UTC
logdir /var/log/chrony
EOF

systemctl enable sshd chronyd nginx php-fpm mariadb
systemctl restart sshd chronyd nginx php-fpm mariadb





# redis 5버전 현재최신 6버전


# http://download.redis.io/releases/

# 몽고디비 4.4.2버전
#rpm -ivh https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.1-1.el8.x86_64.rpm
#rpm -ivh https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-shell-4.4.1-1.el8.x86_64.rpm





#yum=`which yum`

#${yum} install epel-release -y
#${yum} install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
#${yum} install git nginx php php-mysqlnd php-fpm php-json php-pdo -y
