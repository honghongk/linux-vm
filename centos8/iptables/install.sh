#!/bin/sh

if [[ "$BASH_SOURCE" == "$0" ]]; then
    pwd=`pwd`
else
    pwd=`dirname $BASH_SOURCE`
fi

# config 파일
config=$pwd/config


dnf install iptables iptables-services -y
echo ':msg,contains,"iptables log:" /var/log/iptables.log' >> /etc/rsyslog.conf
cat $config > '/etc/sysconfig/iptables'

systemctl enable iptables rsyslog
systemctl restart iptables rsyslog