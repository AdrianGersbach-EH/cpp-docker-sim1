#!/bin/bash

docker rmi "adriangersbach/cpp-docker-sim1"

docker build -t "adriangersbach/cpp-docker-sim1" .
