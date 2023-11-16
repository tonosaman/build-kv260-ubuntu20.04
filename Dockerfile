# Rebuilding the Certified Ubuntu for Xilinx Devices 20.04 LTS Kernel from Source 
# @see https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2287796272
#
# This Dockerfile setup an environment to build kernel packages(*.deb).
# The actual build process is kicked by `podman run ..` at build.sh.

FROM ubuntu:22.04

# Don't prompt with any configuration questions
ENV DEBIAN_FRONTEND noninteractive
# Supress trivial warning
ENV DEBCONF_NOWARNINGS yes

RUN echo "deb-src http://archive.ubuntu.com/ubuntu jammy main" | tee -a /etc/apt/sources.list.d/jammy.list
RUN apt-get update && (apt-get install -y libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf dh-make cpio rsync bc llvm fakeroot gcc-aarch64-linux-gnu linux-tools-common dwarves dpkg-cross) && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV ARCH=arm64 
ENV CROSS_COMPILE=aarch64-linux-gnu-
ENV CONFIG_SITE=/etc/dpkg-cross/cross-config.arm64
ENV DEB_BUILD_OPTIONS=nocheck
