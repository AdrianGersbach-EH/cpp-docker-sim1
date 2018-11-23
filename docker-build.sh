#!/bin/bash

IMAGE_NAME="adriangersbach/cpp-docker-sim1"

docker rmi ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
