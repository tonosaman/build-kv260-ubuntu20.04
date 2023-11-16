# Build kv260-ubuntu22.04-debug

```shell
./build.sh
```

# kernel debuging

```shell
./debug-kria-kgdb-over-usb-serial.sh
```

## [Xilinx Kria KV260 Vision AI Starter Kit](https://ubuntu.com/certified/202104-28895)

Xilinx official downloadable microSD iamge contains an old kernel packages. (2023-11-15)

| Releaces | git.lanchpad.net |
|----------|------------------|
| Ubuntu 22.04 LTS arm64 | [5.15.0-1020-xilinx-zynqmp][] [debian.zynqmp/config/config.common.ubuntu][1020-config] |
| Ubuntu 20.04 LTS arm64 | [5.4.0-1017-xilinx-zynqmp][] [debian.zynqmp/config/config.common.ubuntu][1017-config] |

## Ubuntu linux-xilinx-zynqmp package status (2023-11-15)

- https://launchpad.net/ubuntu/+source/linux-xilinx-zynqmp
- https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy

| Ubuntu 22.04 (Jammy Jellyfish) | update category | tag date |
|----------------|---------------------|------------|
| [5.15.0-1025-xilinx-zynqmp][] [debian.master/config][1025-config] | urgency=medium | 2023-10-31 10:02:14 +1000 |
| [5.15.0-1020-xilinx-zynqmp][] [debian.master/config][1020-config] | urgency=medium | 2023-02-24 21:57:28 +0800 |
| [5.15.0-1010-xilinx-zynqmp][] [debian.master/config][1010-config] | urgency=medium | 2022-06-09 10:16:25 +0800 |

[5.15.0-1025-xilinx-zynqmp]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tag/?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29
[5.15.0-1020-xilinx-zynqmp]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tag/?h=Ubuntu-xilinx-zynqmp-5.15.0-1020.22
[5.15.0-1010-xilinx-zynqmp]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tag/?h=Ubuntu-xilinx-zynqmp-5.15.0-1010.11
[5.4.0-1017-xilinx-zynqmp]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/tag/?h=Ubuntu-xilinx-zynqmp-5.4.0-1017.20
[1025-config]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29
[1020-config]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1020.22
[1017-config]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/focal/plain/debian.zynqmp/config/config.common.ubuntu?h=Ubuntu-xilinx-zynqmp-5.4.0-1017.20
[1010-config]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1010.11

## Edit configs for kernel debugging

- [Debugging Guest Applications with QEMU and GDB](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/821624963/Debugging+Guest+Applications+with+QEMU+and+GDB)
- [Debugging kernel and modules via gdb](https://github.com/Xilinx/linux-xlnx/blob/master/Documentation/dev-tools/gdb-kernel-debugging.rst)@linux-xlnx/Documentation/dev-tools/gdb-kernel-debugging.rst

  - [3497][] CONFIG_DEBUG_INFO_REDUCED policy<{'amd64': 'n', 'arm64': 'n', 'armhf': 'n', 'ppc64el': 'n', 's390x': 'n'}>
  - [4704][] CONFIG_FRAME_POINTER      policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y'}>
  - [4833][] CONFIG_GDB_SCRIPTS        policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 's390x': 'y'}>
  - [9779][] CONFIG_RANDOMIZE_BASE     policy<{'amd64': 'y', 'arm64': 'y', 's390x': 'y'}>

[3497]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29#n3497
[4704]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29#n4704
[4833]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29#n4833
[9779]: https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy/tree/debian.master/config/annotations?h=Ubuntu-xilinx-zynqmp-5.15.0-1025.29#n9779

## [Kernel configuration in Ubuntu](https://discourse.ubuntu.com/t/kernel-configuration-in-ubuntu/35857)
## [BuildYourOwnKernel](https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel)@Ubuntu Wiki

