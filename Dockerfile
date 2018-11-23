FROM ubuntu:16.04

MAINTAINER "Adrian Gersbach"

# Get g++ for compiling, wget to download Boost, git to clone source code repo,
# and make to automate program compilation with Makefile provided
RUN apt-get update \
  && apt-get install -y git \
                        g++ \
                        make \
                        wget

# Download boost, untar, setup install with bootstrap and only do the Program Options library,
# and then install

#ENV BOOST_VERSION=1.67.0
#ENV BOOST_VERSION_=1_67_0

RUN cd /home && wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz \
  && tar xfz boost_1_67_0.tar.gz \
  && rm boost_1_67_0.tar.gz \
  && cd boost_1_67_0 \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=program_options \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_1_67_0

#ENV POCO_VERSION=1.9.0

RUN apt-get update \
  && apt-get install -y iodbc \
                        libssl-dev \
                        libiodbc2 \
                        libmysqld-dev

RUN cd /home && wget http://pocoproject.org/releases/poco-1.9.0/poco-1.9.0-all.tar.gz \
  && tar xfz poco-1.9.0-all.tar.gz \
  && rm poco-1.9.0-all.tar.gz \
  && cd poco-1.9.0-all \
  && ./configure --prefix=/usr/local --omit=Data/ODBC,Data/MySQL,Zip,XML --no-samples --no-tests --typical \
  && make -j8 \
  && make install \
  && cd /home \
  && rm -rf poco-1.9.0-all

#EXPOSE 8080

#CMD["", ""]
