#!/bin/bash

IMAGE_NAME="adriangersbach/cpp-docker-sim1"

#docker run -d -p 2221:9977 --restart unless-stopped --name sim1 ${IMAGE_NAME}
#docker run -d -p 2222:9977 --restart unless-stopped --name sim2 ${IMAGE_NAME}

docker run -d -p 2222:9977 --restart unless-stopped --name sfg500-sim1 --hostname=sfg500-sim1 --net=macvlan1 --ip=192.168.21.221 ${IMAGE_NAME}

docker run -d -p 2222:9977 --restart unless-stopped --name sfg500-sim2 --hostname=sfg500-sim2 --net=macvlan1 --ip=192.168.21.222 ${IMAGE_NAME}


# docker run -d --restart unless-stopped --name sfg500-01 --hostname=pi-bas0002-sfg500-01 --net=macvlan300 --ip=192.168.17.101 -v /var/log/nginx/sfg500/1:/var/log/nginx -v /usr/share/nginx/html/sfg500/1:/usr/share/nginx/html:ro nginx


