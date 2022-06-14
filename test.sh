#!/bin/sh

if [[ $0 == "$BASH_SOURCE" ]];then
    pwd=`pwd`
else
    pwd=`dirname $0`
fi

echo $pwd

# export pwd=`pwd`
# $pwd
# source `pwd`/iptables/install.sh

# echo afeter