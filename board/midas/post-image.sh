#!/bin/sh
#${BR2_EXTERNAL_MIDAS_PATH}/util/mkbootimg --kernel ${BINARIES_DIR}/zImage.exynos4412-i9300 --ramdisk ${BINARIES_DIR}/rootfs.cpio.lzma --cmdline "console=/dev/tty0" --base 0x40000000 --pagesize 2048 -o ${BINARIES_DIR}/boot.img

BOARD_DIR=$(dirname $0)

mkimage=$HOST_DIR/bin/mkimage

run() { echo "$@"; "$@"; }
die() { echo "$@" >&2; exit 1; }
test -f $BINARIES_DIR/zImage || die "no zImage"
test -x $mkimage || die "no mkimage (need host-uboot-tools)"

run cp $BOARD_DIR/kernel.its $BINARIES_DIR/kernel.its || exit 1
echo "Entering $BINARIES_DIR for next command..."
(cd $BINARIES_DIR && run $mkimage -f kernel.its boot.itb) || exit 1
rm -f $BINARIES_DIR/kernel.its

sh ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/create_4412_sd_image.sh \
    ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/p4412_s_fwbl1.bin \
    ${BINARIES_DIR}/midas-spl.bin ${BINARIES_DIR}/u-boot.bin \
    ${BINARIES_DIR}/sdcard_bootloader.bin

sh ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/create_4412_emmc_image.sh \
    ${BR2_EXTERNAL_MIDAS_PATH}/board/midas/p4412_s_fwbl1.bin \
    ${BINARIES_DIR}/midas-spl.bin ${BINARIES_DIR}/u-boot.bin \
    ${BINARIES_DIR}/bootloader.bin

