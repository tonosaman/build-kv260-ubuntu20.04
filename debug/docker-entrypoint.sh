#!/bin/sh
agent-proxy 4440^4441 0 /dev/ttyUSB1,115200 &
gdb-multiarch -iex "set auto-load safe-path /build/src/scripts/gdb/vmlinux-gdb.py" \
	-ex "target remote localhost:4441" \
	./debian/build/build-xilinx-zynqmp/vmlinux
