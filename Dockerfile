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

ARG BOOST_VERSION=1.67.0
ARG BOOST_VERSION_=1_67_0

RUN cd /home && wget https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_}.tar.gz \
  && tar xfz boost_${BOOST_VERSION_}.tar.gz \
  && rm boost_${BOOST_VERSION_}.tar.gz \
  && cd boost_${BOOST_VERSION_} \
  && ./bootstrap.sh --prefix=/usr/local --with-libraries=chrono,date_time,filesystem,program_options,random,regex,serialization,signals,system,thread \
  && ./b2 install \
  && cd /home \
  && rm -rf boost_${BOOST_VERSION_}

ENV PATH="${PATH}:/usr/local/lib"

ARG POCO_VERSION=1.9.0

RUN apt-get update \
  && apt-get install -y iodbc \
                        libssl-dev \
                        libiodbc2 \
                        libmysqld-dev

RUN cd /home && wget http://pocoproject.org/releases/poco-${POCO_VERSION}/poco-${POCO_VERSION}-all.tar.gz \
  && tar xfz poco-${POCO_VERSION}-all.tar.gz \
  && rm poco-${POCO_VERSION}-all.tar.gz \
  && cd poco-${POCO_VERSION}-all \
  && ./configure --prefix=/usr/local --no-samples --no-tests --minimal --shared \
  && make -j8 \
  && make install \
  && cd /home \
  && ldconfig \
  && rm -rf poco-${POCO_VERSION}-all

# Copy EchoServer
COPY app/ /home/app/

# Expose the port
EXPOSE 9977

CMD ["/home/app/bin/Linux/x86_64/EchoServer"]

