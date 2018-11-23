# cpp-docker-sim1

chmod +x filename.sh

https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04

https://www.serverlab.ca/tutorials/containers/docker/how-to-set-the-proxy-for-docker-on-ubuntu/

# Docker

```
$ sudo build -t <name> .
```

```
$ sudo docker exec -it <container-id> /bin/bash
```

```
$ sudo docker run -it <image> /bin/bash
```

Remove all stopped containers
```
$ sudo docker rm $(docker ps -a -q)
```
