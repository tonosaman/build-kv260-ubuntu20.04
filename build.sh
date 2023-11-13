#!/bin/sh

mkdir -p ./build
if [ ! -d ./build/src ]; then
    git clone --depth 1 --branch Ubuntu-xilinx-zynqmp-5.4.0-1020.24 \
    https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal build/src/
fi

docker build . -t build-kv260-ubuntu:22.04 

docker run --rm -it \
    -v $PWD/build:/build \
    -w /build/src \
    build-kv260-ubuntu:22.04 \
    sh -c 'export $(dpkg-architecture -aarm64); fakeroot debian/rules clean; fakeroot debian/rules binary'

md5sum build/*.deb
