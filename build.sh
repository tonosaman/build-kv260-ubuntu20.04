#!/bin/sh

docker build . -t build-kv260-ubuntu:22.04

mkdir -p ./build
if [ ! -d ./build/src ]; then
    git clone --depth 1 --branch Ubuntu-xilinx-zynqmp-5.15.0-1026.30 \
    https://git.launchpad.net/~canonical-kernel/ubuntu/+source/linux-xilinx-zynqmp/+git/jammy build/src/
    (cd build/src; git switch -c Ubuntu-xilinx-zynqmp-5.15.0-1026.30)
fi

patch -p1 --forward -r - -d build/src << "EOS"
diff --git a/debian/rules.d/2-binary-arch.mk b/debian/rules.d/2-binary-arch.mk
index 13d80c2a5..e108c2ff7 100644
--- a/debian/rules.d/2-binary-arch.mk
+++ b/debian/rules.d/2-binary-arch.mk
@@ -33,6 +33,8 @@ $(stampdir)/stamp-prepare-tree-%: debian/scripts/fix-filenames
 	if [ -e $(commonconfdir)/config.common.ubuntu ]; then \
 		cat $(commonconfdir)/config.common.ubuntu $(archconfdir)/config.common.$(arch) $(archconfdir)/config.flavour.$(target_flavour) > $(builddir)/build-$*/.config; \
 	else \
+		echo "CONFIG_RANDOMIZE_BASE                           policy<{'arm64': 'n'}>" >> debian.zynqmp/config/annotations; \
+		echo "CONFIG_RANDOMIZE_MODULE_REGION_FULL             policy<{'arm64': '-'}>" >> debian.zynqmp/config/annotations; \
 		python3 debian/scripts/misc/annotations --export --arch $(arch) --flavour $(target_flavour) | sed -e 's/.*CONFIG_VERSION_SIGNATURE.*/CONFIG_VERSION_SIGNATURE="Ubuntu $(release)-$(revision)-$* $(raw_kernelversion)"/' > $(builddir)/build-$*/.config; \
 	fi
 	sed -i 's/.*CONFIG_VERSION_SIGNATURE.*/CONFIG_VERSION_SIGNATURE="Ubuntu $(release)-$(revision)-$* $(raw_kernelversion)"/' $(builddir)/build-$*/.config
EOS

docker run --rm -it \
    -v $PWD/build:/build \
    -w /build/src \
    build-kv260-ubuntu:22.04 \
    sh -c 'export $(dpkg-architecture -aarm64); fakeroot debian/rules clean; fakeroot debian/rules binary-headers binary skipdbg=false'

md5sum build/*.deb

sudo patch -p1 --forward -r - -d build/src << "EOS"
diff --git a/debian/rules.d/2-binary-arch.mk b/debian/rules.d/2-binary-arch.mk
--- a/debian/build/build-xilinx-zynqmp/scripts/gdb/linux/constants.py
+++ b/debian/build/build-xilinx-zynqmp/scripts/gdb/linux/constants.py
@@ -1,13 +1,13 @@
 import gdb
 LX_CONFIG_DEBUG_INFO_REDUCED = 0
 if 1:
-    LX_CLK_GET_RATE_NOCACHE = gdb.parse_and_eval("((((1UL))) << (6))")
-LX_SB_RDONLY = ((((1UL))) << (0))
-LX_SB_SYNCHRONOUS = ((((1UL))) << (4))
-LX_SB_MANDLOCK = ((((1UL))) << (6))
-LX_SB_DIRSYNC = ((((1UL))) << (7))
-LX_SB_NOATIME = ((((1UL))) << (10))
-LX_SB_NODIRATIME = ((((1UL))) << (11))
+    LX_CLK_GET_RATE_NOCACHE = gdb.parse_and_eval("((((1))) << (6))")
+LX_SB_RDONLY = ((((1))) << (0))
+LX_SB_SYNCHRONOUS = ((((1))) << (4))
+LX_SB_MANDLOCK = ((((1))) << (6))
+LX_SB_DIRSYNC = ((((1))) << (7))
+LX_SB_NOATIME = ((((1))) << (10))
+LX_SB_NODIRATIME = ((((1))) << (11))
 LX_hrtimer_resolution = gdb.parse_and_eval("hrtimer_resolution")
 LX_MNT_NOSUID = 0x01
 LX_MNT_NODEV = 0x02
EOS

