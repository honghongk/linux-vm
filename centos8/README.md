초기 설정 대충 스크립트 파일



재시작 후 ssh 안될때 접속하기
https://cloud.google.com/compute/docs/instances/interacting-with-serial-console#gcloud

gcloud compute project-info add-metadata --metadata serial-port-enable=TRUE

gcloud compute instances add-metadata '인스턴스이름' --metadata serial-port-enable=TRUE

gcloud compute connect-to-serial-port '인스턴스 이름'


입력 후 존 설정까지 잘 되면

root비번? 으로 키 입력하면 접속됨 (실제 컴퓨터 처음켯을때처럼 접속됨)
