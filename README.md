# build-kv260-ubuntu22.04

Dockerfile for building Ubuntu 22.04 on Xilinx Kria KV260 kernel image package (*.deb) 

| md5sum | dpkg |
|---------|---------------|
| b08f7d735ff34d4c6369d814280258f8 | linux-buildinfo-5.4.0-1020-xilinx-zynqmp_5.4.0-1020.24_arm64.deb |
| 880f9abf1c16386506bf88ada3116166 | linux-headers-5.4.0-1020-xilinx-zynqmp_5.4.0-1020.24_arm64.deb   |
| 3a57603fa9d0649c0a996910e626a918 | linux-image-5.4.0-1020-xilinx-zynqmp_5.4.0-1020.24_arm64.deb     |
| 365667c83f7d4318aabd877533b26d55 | linux-modules-5.4.0-1020-xilinx-zynqmp_5.4.0-1020.24_arm64.deb   |
| a5e3eb55903bbbd1a034fcdb77ba479f | linux-xilinx-zynqmp-headers-5.4.0-1020_5.4.0-1020.24_all.deb     |

[![Packaging kernel of Ubuntu-xilinx-zynqmp-5.4.0-1017.20](https://github.com/tonosaman/build-kv260-ubuntu20.04/actions/workflows/build-packages.yml/badge.svg)](https://github.com/tonosaman/build-kv260-ubuntu20.04/actions/workflows/build-packages.yml)

## [Xilinx Kria KV260 Vision AI Starter Kit](https://ubuntu.com/certified/202104-28895)

| Releaces | git.lanchpad.net |
|----------|------------------|
| Ubuntu 22.04 LTS arm64 | [5.15.0-1020-xilinx-zynqmp](https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/tag/?h=Ubuntu-xilinx-zynqmp-5.4.0-1020.24) [debian.zynqmp/config/config.common.ubuntu](https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/plain/debian.zynqmp/config/config.common.ubuntu?h=Ubuntu-xilinx-zynqmp-5.4.0-1020.24) |
| Ubuntu 20.04 LTS arm64 | [5.4.0-1017.20-xilinx-zynqmp](https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/tag/?h=Ubuntu-xilinx-zynqmp-5.4.0-1017.20) [debian.zynqmp/config/config.common.ubuntu](https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/plain/debian.zynqmp/config/config.common.ubuntu?h=Ubuntu-xilinx-zynqmp-5.4.0-1017.20) |

## [BuildYourOwnKernel](https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel)@Ubuntu Wiki

- [debian.zynqmp/config/config.common.ubuntu](https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/tree/debian.zynqmp/config/config.common.ubuntu)


https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/tree/debian.zynqmp/config/config.common.ubuntu?h=Ubuntu-xilinx-zynqmp-5.4.0-1020.24

