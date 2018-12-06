FROM alpine:3.8

MAINTAINER "Adrian Gersbach"

ARG LIBPATH=/usr/local
ENV PATH="${PATH}:${LIBPATH}/lib"

# Download boost, untar, setup install with bootstrap and only do the Program Options library,
# and then install

ARG BOOST_VERSION=1.68.0
ARG BOOST_VERSION_=1_68_0

RUN apk add --update --no-cache --virtual .build-deps g++ make wget \
  && cd /home && wget https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_}.tar.gz \
  && tar xfz boost_${BOOST_VERSION_}.tar.gz \
  && rm boost_${BOOST_VERSION_}.tar.gz \
  && cd boost_${BOOST_VERSION_} \
  && ./bootstrap.sh --prefix=${LIBPATH} --with-libraries=atomic,chrono,date_time,filesystem,program_options,random,regex,serialization,signals,system,thread \
  && ./b2 -j8 install \
  && ldconfig ${LIBPATH}/lib \
  && cd /home \
  && rm -rf boost_${BOOST_VERSION_} \
  && apk del .build-deps

ARG POCO_VERSION=1.9.0

RUN apk add --update --no-cache --virtual .build-deps cmake git g++ make wget linux-headers \
  && cd /home && wget http://pocoproject.org/releases/poco-${POCO_VERSION}/poco-${POCO_VERSION}-all.tar.gz \
  && tar xfz poco-${POCO_VERSION}-all.tar.gz \
  && rm poco-${POCO_VERSION}-all.tar.gz \
  && cd poco-${POCO_VERSION}-all \
  && mkdir cmake_build \
  && cd cmake_build \
  && cmake -DWT_CPP_11_MODE='-std=c++11' -DENABLE_MONGODB=OFF -DENABLE_REDIS=OFF -DENABLE_PDF=OFF -DENABLE_NETSSL=OFF -DENABLE_DATA_SQLITE=OFF -DENABLE_DATA_ODBC=OFF -DENABLE_DATA_MYSQL=OFF -DENABLE_SEVENZIP=OFF -DENABLE_ZIP=OFF -DENABLE_PAGECOMPILER=OFF -DENABLE_PAGECOMPILER_FILE2PAGE=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${LIBPATH} .. \
  && make -j8 \
  && make install \
  && ldconfig ${LIBPATH}/lib \
  && cd /home \
  && rm -rf poco-${POCO_VERSION}-all \
  && apk del .build-deps

# Copy EchoServer
COPY app/ /home/app/

# Expose the port
EXPOSE 80
EXPOSE 6010
EXPOSE 9977

CMD ["/home/app/bin/Linux/x86_64/EchoServer"]
