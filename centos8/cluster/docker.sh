#!/bin/sh


# if [[ "$BASH_SOURCE" == "$0" ]]; then
#     pwd=`pwd`
# else
#     pwd=`dirname $BASH_SOURCE`
# fi

# repo=$pwd/docker-ce.repo
# cat $repo > /etc/yum.repos.d/docker-ce.repo


# 리눅스 네이티브 컨테이너
# 도커랑 비슷한 명령어 등 작동방식인데 데몬 안띄워도됨
dnf erase podman buildah


dnf config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

dnf -y install device-mapper-persistent-data lvm2
dnf -y install docker-ce docker-ce-cli containerd.io


systemctl enable containerd
systemctl start containerd
systemctl enable docker
systemctl restart docker


# 여전히 에러 많이남