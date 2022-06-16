#!/bin/sh

# 따로 추가할라면 yum 하던대로
dnf update -y

dnf install epel-release -y
dnf install git wget -y
dnf install certbot -y

# 리눅스 한글 언어팩 추가
dnf install glibc-langpack-ko -y


# 세팅
timedatectl set-timezone Asia/Seoul
localectl set-locale LANG=ko_KR.utf8
setenforce 0

cat << EOF > /etc/ssh/sshd_config
Port 22
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

source `pwd`/iptables/install.sh
source `pwd`/webserver/httpd.sh
source `pwd`/php/8.1.sh
source `pwd`/db/mariadb10.5.sh
# source `pwd`/iptables/install.sh




systemctl enable sshd chronyd
systemctl restart sshd chronyd

