# buildroot-external-midas

This is a [BR2_EXTERNAL](https://buildroot.org/downloads/manual/manual.html#outside-br-custom) tree for [Buildroot](https://buildroot.org/) which contains stuff needed
to boot a mainline Linux kernel on Samsung's midas (Galaxy S3, Galaxy Note 2) boards.

## Quick start
Clone buildroot:
```
git clone git://git.buildroot.net/buildroot
```

Clone this repo:
```
git clone https://github.com/fourkbomb/buildroot-external-midas
```

Build it:
```
make -C buildroot O=$PWD/output BR2_EXTERNAL=$PWD/buildroot-external-midas samsung_midas_defconfig
```

If you wish to make modifications to [the kernel used](https://github.com/fourkbomb/linux/tree/master), clone it somewhere (you probably want to use the `master` branch)
and edit local.mk.template appropriately:

```
cp buildroot-external-midas/local.mk.template output/local.mk
vim output/local.mk
```

Now, start the build in the `output` directory:
```
cd output
make
```

The first build may take a while, so be patient.

To install, you can either use [heimdall](https://glassechidna.com.au/heimdall/): `heimdall flash --BOOT output/images/boot.img`
or use `dd` on the device: `dd if=/path/to/boot.img of=/dev/block/platform/dw_mmc/by-name/BOOT` (the path will be different if you're not using the 3.0 vendor kernel).

You can either use a USB-to-UART cable described [here](https://forkwhiletrue.me/posts/uart-on-galaxy-s3/), or you can use a plain old USB cable.
Use `screen /dev/ttyUSB0 115200` for the USB-to-UART cable, or `screen /dev/ttyACM0` for a USB cable.

