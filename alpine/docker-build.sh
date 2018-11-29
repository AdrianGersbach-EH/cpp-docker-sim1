#!/bin/bash

IMAGE_NAME="age/alpine-cpp-sim1"

#docker rmi ${IMAGE_NAME}
docker build -t ${IMAGE_NAME} .
