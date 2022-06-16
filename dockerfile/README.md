# 포드안에 컨테이너 넣으면서 만들기
> podman run -dt --pod new:nginx -p 1234:80 quay.io/libpod/alpine_nginx:latest

> podman run -dt --pod new:podset -p 1234:80 registry.centos.org/centos/httpd-24-centos7

> podman build -t apm centos7-apm

> podman run --log-level=debug -it -p 81:80 localhost/apm


# 빌드 다시하면서 남는 찌꺼기 삭제
> podman rmi $(podman images -f "dangling=true" -q)


# 쿠버네티스 yaml 파일로 만들기
> podman generate kube 컨테이너_아이디

# 디버스 서비스 파일로 만들기
> podman generate systemd 컨테이너_아이디


