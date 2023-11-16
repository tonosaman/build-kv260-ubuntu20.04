#!/bin/sh

if [ -z "$(docker images -q debug-kv260-ubuntu:22.04 2> /dev/null)" ]; then
	(cd debug/; docker build . -t debug-kv260-ubuntu:22.04)
fi

cat <<'EOF'
USAGE:
 Step 1: Connect USB serial cable between host and kv260
   (host)  ... /dev/ttyUSB1
   (kv260) ... /dev/ttyPS1
 Step 2: Run this script
   (host-terminal-1) ./debug-kria-kgdb-over-usb-serial.sh
 Step 3: Login kv260
   (host-terminal-2) telnet localhost 4440
 Step 4: Enter kgdb break
   (kv260@host-terminal-2) sudo sh -c 'echo ttyPS1 > /sys/module/kgdboc/parameters/kgdboc; echo g > /proc/sysrq-trigger'
 Step 5: Connect gdb to kv260
   (gdb@host-terminal-1) target remote localhost:4441
EOF

docker run --rm -it \
    -v $PWD/build:/build \
    -p 4440:4440 \
    --device=/dev/ttyUSB1 \
    -w /build/src \
    --cap-add=sys_ptrace \
    debug-kv260-ubuntu:22.04
