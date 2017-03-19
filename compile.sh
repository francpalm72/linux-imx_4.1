#!/bin/sh
source /opt/poky/1.7.1/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi
export LDFLAGS=""
make 
export LOADADDR=0x10008000
make uImage
mkdir -p install_dir
cp arch/arm/boot/uImage install_dir
cp arch/arm/boot/dts/imx6q-marta.dtb install_dir
make modules_install INSTALL_MOD_PATH=./install_dir/
