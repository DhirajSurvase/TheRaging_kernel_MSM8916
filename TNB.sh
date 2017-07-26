#!/bin/sh

#
 # Copyright © 2017, Varun Vaishnav <gamelovr695@gmail.com>
 #
 # Custom build script
 #
 # This software is licensed under the terms of the GNU General Public
 # License version 2, as published by the Free Software Foundation, and
 # may be copied, distributed, and modified under those terms.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # Use it I also Have kanged it from somewhere- Dis Nigga Is bad
#
restore='\033[0m'
KERNEL_DIR=$PWD
KERNEL="zImage"
ANYKERNEL_DIR="$KERNEL_DIR/arch/arm/boot/"
REPACK_DIR="$ANYKERNEL_DIR"
ZIP_MOVE="$KERNEL_DIR"
KERN_IMG=$KERNEL_DIR/arch/arm/boot/zImage
DTBTOOL=$KERNEL_DIR/scripts/dtbToolCM
BASE_VER="TNB"
VER="-R4-$(date +"%Y-%m-%d"-%H%M)-"
TheNewBeginning_VER="$BASE_VER$VER$TC"
BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
green='\033[01;32m'
red='\033[0;31m'
blink_red='\033[05;31m'
nocol='\033[0m'
TC="GCC-4.8"
# Modify the following variable if you want to build
export CROSS_COMPILE="/"
export ARCH=arm64
#export SUBARCH=arm
export KBUILD_BUILD_USER="V@RuN"
export KBUILD_BUILD_HOST="TheNewBeginning"
STRIP="/"
MODULES_DIR=$KERNEL_DIR/arch/arm/boot/AnyKernel2/modules
echo -e "$green***********************************************"
echo "           You are Building The New Beginning  "
echo -e "***********************************************$nocol"

echo -e "${green}"
echo "--------------------------------------------------------"
echo "    Wellcome !!!   Initiatig To Compile R4    "
echo "--------------------------------------------------------"
echo -e "$yellow***********************************************"
echo "          Compiling TNB kernel          "
echo -e "***********************************************$nocol"
rm -f $KERN_IMG
echo -e "$red***********************************************"
echo "          Cleaning Up Before Compile          "
echo -e "***********************************************$nocol"
echo -e "$yellow***********************************************"
echo "          Initialising DEFCONFIG        "
echo -e "***********************************************$nocol"
make A6000_defconfig -j6
gedit .config
echo -e "$yellow***********************************************"
echo "          Cooking TNB Kernel         "
echo -e "***********************************************$nocol"
make -j6
echo -e "$yellow***********************************************"
echo "          GENERATING DEVICE TREE BLOBS          "
echo -e "***********************************************$nocol"
make dtbs -j6
echo -e "$yellow***********************************************"
echo "         Modules & Stuffs        "
echo -e "***********************************************$nocol"
$DTBTOOL -2 -o $KERNEL_DIR/arch/arm/boot/dtb -s 2048 -p $KERNEL_DIR/scripts/dtc/ $KERNEL_DIR/arch/arm/boot/dts/
echo -e "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds.$nocol"
