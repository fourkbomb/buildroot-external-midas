#!/bin/sh
abootimg --create ${BINARIES_DIR}/boot.img -f ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/midas.cfg -k ${BINARIES_DIR}/zImage.exynos4412-midas -r ${BINARIES_DIR}/rootfs.cpio.lzma
