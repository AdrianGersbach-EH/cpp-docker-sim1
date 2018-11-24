# cpp-docker-sim1

chmod +x filename.sh

https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

https://www.serverlab.ca/tutorials/containers/docker/how-to-set-the-proxy-for-docker-on-ubuntu/

# Docker

```
$ sudo build -t <name> .
```

# How to get bash into a running container in background mode
```
$ sudo docker exec -it <container-id> /bin/bash
```

```
$ sudo docker run -it <image> /bin/bash
```

```
$ sudo docker run -d -p 8081:8080 --restart unless-stopped --name sfg500-sim1 <image>
```

```
$ sudo docker ps -a -q --filter="name=<containerName>"
```

Remove all stopped containers
```
$ sudo docker rm $(sudo docker ps -a -q)
```

```
#!/bin/bash

# Delete all containers
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)
```

# LAN eth0
```
$ sudo docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1 -o parent=eth0 macvlan1
```

# Docker Compose
Installing Docker Compose

https://github.com/docker/compose/releases

```
$ sudo curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ sudo docker-compose --version
```
Build
```
$ sudo docker-compose build
```
Build and Start
```
$ sudo docker-compose up -d
```
Stop
```
$ sudo docker-compose down
```
Stop and Remove
```
$ sudo docker-compose down --rmi all
```
