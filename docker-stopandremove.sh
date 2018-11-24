#!/bin/bash

IMAGE_NAME="adriangersbach/cpp-docker-sim1"

docker rm $(docker stop $(docker ps -a -q --filter="ancestor=${IMAGE_NAME}"))
