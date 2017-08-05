#!/bin/bash

###############################################################################
# Custom Builds Script                                                        #
# CR- Varun Vaishnav <gamelovr695@gmail.com>                                  #

#Install Necessary Libs To Compile
echo "Installing Ccache and libncurses, make sure you have an Internet Connection"
sudo apt install ccache
sudo apt install libncurses-dev

#exportstuff
echo "Cleaning and exporting"
export ARCH=arm64
export CROSS_COMPILE=$Edit This If you want to build$
make clean && make mrproper
echo "Exporting User And Host"
export KBUILD_BUILD_USER="$"
export KBUILD_BUILD_HOST="$"

#Pointtheconfigs
echo "making defconfig"
make A6000_defconfig

#Build
echo "Compiling ThePossessedKernel"
make -j5
echo "Generating Dtb"
/$/scripts/dtbToolCM -2 -o /$/arch/arm/boot/dt.img -s 2048 -p /$/scripts/dtc/ /$/arch/arm/boot/dts/
echo "Now GTFO bish"
