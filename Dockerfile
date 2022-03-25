# Rebuilding the Certified Ubuntu for Xilinx Devices 20.04 LTS Kernel from Source 
# @see https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2287796272
#
# This Dockerfile setup an environment to build kernel packages(*.deb).
# The actual build process is kicked by `podman run ..` at build.sh.

FROM ubuntu:20.04

# Don't prompt with any configuration questions
ENV DEBIAN_FRONTEND noninteractive
# Supress trivial warning
ENV DEBCONF_NOWARNINGS yes

RUN echo "deb-src http://archive.ubuntu.com/ubuntu focal main" | tee -a /etc/apt/sources.list.d/focal.list
RUN apt-get update && (apt-get -y build-dep linux; apt-get install -y git fakeroot libncurses-dev gcc-aarch64-linux-gnu linux-tools-common) && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV ARCH=arm64 
ENV CROSS_COMPILE=aarch64-linux-gnu-
