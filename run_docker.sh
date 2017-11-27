#!/bin/bash

docker_image=$1
docker_ports=$2

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce

curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
chmod +x docker-compose

systemctl start docker

docker run --detach --restart unless-stopped -p $docker_ports -d $docker_image

docker pull osehra/osehravista
docker run -p 9430:9430 -p 8001:8001 -p 2222:22 -d -P --name=osehravista osehra/osehravista
