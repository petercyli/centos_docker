#!/bin/bash

docker_image=$1
docker_ports=$2

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker

docker run --detach --restart unless-stopped -p $docker_ports -d $docker_image
