#!/bin/sh



# podman cni 인터페이스 아이피 대역 허용해야 컨테이너에서 외부로 요청 보낼 수 있음

dnf install podman buildah podman-compose

systemctl enable podman
systemctl start podman