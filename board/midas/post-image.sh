#!/bin/sh
${BR2_EXTERNAL_MIDAS_PATH}/util/mkbootimg --kernel ${BINARIES_DIR}/zImage.exynos4412-i9300 --ramdisk ${BINARIES_DIR}/rootfs.cpio.lzma --cmdline "console=/dev/tty0" --base 0x40000000 --pagesize 2048 -o ${BINARIES_DIR}/boot.img
