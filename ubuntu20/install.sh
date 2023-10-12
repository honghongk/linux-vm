#!/bin/bash

# 기본 설치
apt update -y
apt install -y git net-tools iputils-ping wget gzip


# 타임존 세팅
apt install -y ntp systemd-timesyncd

timedatectl set-timezone Asia/Seoul
timedatectl set-ntp yes


# 언어셋 세팅
apt install -y language-pack-ko-base language-pack-ko

localectl set-locale ko_KR.UTF-8

