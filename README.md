# cpp-docker-sim1

chmod +x filename.sh

# Docker

```
sudo build -t <name> .
```

# How to get bash into a running container in background mode
```
sudo docker exec -it <container-id> /bin/bash
```

```
sudo docker run -it <image> /bin/bash
```

```
sudo docker run -d -p 8081:8080 --restart unless-stopped --name sfg500-sim1 <image>
```

```
sudo docker ps -a -q --filter="name=<containerName>"
```

Remove all stopped containers
```
sudo docker rm $(sudo docker ps -a -q)
```

```
#!/bin/bash

# Delete all containers
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)
```

## LAN eth0
```
docker network create -d macvlan --subnet=192.168.100.0/24 --gateway=192.168.100.1 -o parent=eth0 macvlan1
```
## LAN eth0.50
```
docker network create -d macvlan --subnet=192.168.50.0/24 --gateway=192.168.50.1 -o parent=eth0.50 macvlan50
```

# Creating Proxy Configuration
```
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo vi /etc/systemd/system/docker.service.d/proxy.conf

[Service]
Environment="HTTP_PROXY=http://myproxy.hostname:8080"
Environment="HTTPS_PROXY=https://myproxy.hostname:8080"
Environment="NO_PROXY=localhost,127.0.0.1,::1"

sudo systemctl daemon-reload

sudo systemctl restart docker.service
```
https://www.serverlab.ca/tutorials/containers/docker/how-to-set-the-proxy-for-docker-on-ubuntu/

# Docker Compose
Installing Docker Compose

https://github.com/docker/compose/releases

```
sudo curl -L https://github.com/docker/compose/releases/download/1.23.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
```

https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

```
# Install required packages
apt update
apt install -y python python-pip

# Install Docker Compose from pip
pip install docker-compose
```
https://withblue.ink/2017/12/31/yes-you-can-run-docker-on-raspbian.html

Build
```
sudo docker-compose build
```
Build and Start
```
sudo docker-compose up -d
```
Stop
```
sudo docker-compose down
```
Stop and Remove
```
sudo docker-compose down --rmi all
```

# Links

docker-libpoco-Dockerfile at master · JLospinoso-docker-libpoco
https://github.com/JLospinoso/docker-libpoco/blob/master/Dockerfile
