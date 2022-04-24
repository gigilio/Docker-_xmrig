FROM alpine

LABEL maintainer="Patrice Ferlet <metal3d@gmail.com>"

ARG VERSION=6.12.1
    
RUN set -xe;\
    echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    apk update; \
    apk add util-linux build-base cmake libuv-static libuv-dev openssl-dev hwloc-dev@community; \
    wget https://github.com/xmrig/xmrig/archive/v${VERSION}.tar.gz; \
    tar xf v${VERSION}.tar.gz; \
    mkdir -p xmrig-${VERSION}/build; \
    cd xmrig-${VERSION}/build; \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib/libuv.a;\
    make -j $(nproc); \
    cp xmrig /usr/local/bin/xmrig;\
    rm -rf xmrig* *.tar.gz; \
    apk del build-base; \
    apk del openssl-dev;\ 
    apk del hwloc-dev; \
    apk del cmake; \
    apk add hwloc@community;

ENV POOL_USER="85Vk6wJgVJGQ1394EDLZpKWVRMovnKXbJbcFB9fDhr9Fc99QQWBJLGGh8NPLXesfr6SLCzWCuh2jTcJYsVp1ZpG62pA8Dcd" \
    POOL_PASS="docker" \
    POOL_URL="gulf.moneroocean.stream:10032" \
    DONATE_LEVEL=1 \
    PRIORITY=0 \
    THREADS=1

ADD entrypoint.sh /entrypoint.sh
WORKDIR /tmp
EXPOSE 3000
CMD ["/entrypoint.sh"]
