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
	elif [ "$param" = "dtb" ]; then
		cpp -nostdinc -I include -I arch  -undef -x assembler-with-cpp ./arch/arm/boot/dts/imx6q-marta.dts ./arch/arm/boot/dts/imx6q-marta.dts.preprocessed
		dtc -I dts -O dtb -o ./arch/arm/boot/dts/imx6q-marta.dtb ./arch/arm/boot/dts/imx6q-marta.dts.preprocessed
		cp ./arch/arm/boot/dts/imx6q-marta.dtb ./install_dir
		rm ./arch/arm/boot/dts/imx6q-marta.dtb
		rm ./arch/arm/boot/dts/imx6q-marta.dts.preprocessed
	else
		echo "source ./compile.sh env"
		echo "source ./compile.sh clean"
		echo "source ./compile.sh build"
	fi	
done
