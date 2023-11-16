# Rebuilding the Certified Ubuntu for Xilinx Devices 20.04 LTS Kernel from Source 
# @see https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2287796272
#
# This Dockerfile setup an environment to build kernel packages(*.deb).
# The actual build process is kicked by `podman run ..` at build.sh.

FROM build-kv260-ubuntu:22.04

RUN apt-get update && apt-get install -y gdb-multiarch git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN git clone https://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/ && \
    cd agent-proxy && CROSS_COMPILE= make && cp agent-proxy /usr/bin/
COPY ./docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
