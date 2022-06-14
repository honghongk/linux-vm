#!/bin/sh

# config 파일
config=`dirname $BASH_SOURCE`/config


dnf install iptables iptables-services -y
echo ':msg,contains,"iptables log:" /var/log/iptables.log' >> /etc/rsyslog.conf
cat $config > '/etc/sysconfig/iptables'

systemctl stop firewalld
systemctl enable iptables rsyslog
systemctl restart iptables rsyslog