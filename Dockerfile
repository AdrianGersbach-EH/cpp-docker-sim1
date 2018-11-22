FROM ubuntu:16.04

MAINTAINER "Adrian Gersbach"

ENV BOOST_VERSION=1_67_0
ENV POCO_VERSION=1.9.0

RUN apt-get update && apt-get upgrade -y && apt-get install wget build-essential -y

# Create app directory
WORKDIR /usr/src/app

RUN wget https://dl.bintray.com/boostorg/release/1.66.0/source/${BOOST_VERSION}.tar.gz

RUN wget http://pocoproject.org/releases/poco-${POCO_VERSION}/poco-${POCO_VERSION}-all.tar.gz && tar xzvf poco-${POCO_VERSION}-all.tar.gz

#EXPOSE 8080

#CMD["", ""]
