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
$sudo docker ps -a -q --filter="name=<containerName>"
```

Remove all stopped containers
```
$ sudo docker rm $(docker ps -a -q)
```

# LAN eth0
```
$ sudo docker network create -d macvlan --subnet=192.168.0.0/24 --gateway=192.168.0.1 -o parent=eth0 macvlan1
```
