#!/bin/sh
export ARCH=arm64
export KSRC=/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux
export KDIR=/project/workspace2/frazho01/CodeBase/DPU/qemu/qemu_daqian_dx2/qemu_dq_dx/linux_5.10/linux/out/juno/linux
export CROSS_COMPILE=/project/workspace1/frazho01/tools/gcc-linaro-6.2.1-2016.11-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILEg}g++

make -j16

cp test-component.ko  /project/workspace2/nfsroot/frazho01/rootfs_linux_arm64/mnt/dpu
