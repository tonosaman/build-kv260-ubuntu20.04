#!/bin/sh

mkdir -p ./build
if [ ! -d ./build/src ]; then
    git clone --depth 1 --branch Ubuntu-xilinx-zynqmp-5.4.0-1017.20 https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal build/src/
fi
# KVM & NTFS enabled
cp config-5.4.0-1017-xilinx-zynqmp build/src/debian.zynqmp/config/config.common.ubuntu

podman build -t build-kv260-ubuntu:20.04 -f Dockerfile

podman run --rm -it \
    -v $PWD/build:/build \
    -w /build/src \
    build-kv260-ubuntu:20.04 \
    sh -c 'export $(dpkg-architecture -aarm64); fakeroot debian/rules clean; fakeroot debian/rules binary'

md5sum build/*.deb
