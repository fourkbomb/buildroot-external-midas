#!/bin/sh
${BR2_EXTERNAL_MIDAS_PATH}/util/mkbootimg --kernel ${BINARIES_DIR}/zImage.exynos4412-midas --ramdisk ${BINARIES_DIR}/rootfs.cpio.lzma --cmdline "ignored by bootloader" --base 0x40000000 --pagesize 2048 -o ${BINARIES_DIR}/boot.img
