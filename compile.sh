#!/bin/sh

for param in $*
do 	
	if [ "$param" = "env" ]; then
		source /opt/poky/2.2.2/environment-setup-cortexa9hf-neon-poky-linux-gnueabi
		export LDFLAGS=""
	elif [ "$param" = "clean" ]; then
		make clean
		make imx6q_marta_defconfig
	elif [ "$param" = "build" ]; then
		make -j4 zImage imx6q-marta.dtb
		cp arch/arm/boot/zImage ./install_dir/
		cp arch/arm/boot/dts/imx6q-marta.dtb ./install_dir/
	else
		echo "source ./compile.sh env"
		echo "source ./compile.sh clean"
		echo "source ./compile.sh build"
	fi	
done
