#!/bin/sh
${BR2_EXTERNAL_MIDAS_PATH}/util/mkbootimg --kernel ${BINARIES_DIR}/zImage.exynos4412-i9300 --ramdisk ${BINARIES_DIR}/rootfs.cpio.lzma --cmdline "console=/dev/tty0" --base 0x40000000 --pagesize 2048 -o ${BINARIES_DIR}/boot.img

${BR2_EXTERNAL_MIDAS_PATH}/board/midas/create_4412_sd_image.sh ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/p4412_s_fwbl1.bin ${BINARIES_DIR}/i9300-spl.bin ${BINARIES_DIR}/u-boot-dtb.bin ${BINARIES_DIR}/sd_image.bin
