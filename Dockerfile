
FROM alpine:3.4

RUN mkdir /opt
Add . /opt/parquet-cpp
WORKDIR /opt
RUN NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add git cmake wget make libc-dev gcc g++ bzip2-dev boost-dev zlib-dev expat-dev && \
    apk add bison flex && \
    cd /opt/parquet-cpp && \
    cmake . && \
    make 