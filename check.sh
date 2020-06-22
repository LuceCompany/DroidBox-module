#!/usr/bin/env bash

set -e -x

KERNEL_V=$(uname -r)
export EX_BINDER=/lib/modules/$KERNEL_V/kernel/drivers/android/binder_linux.ko
export EX_ASHMEM=/lib/modules/$KERNEL_V/kernel/drivers/staging/android/ashmem_linux.ko

if [ $(id -u) -ne 0 ];
then
    echo "You must be login as root";
    exit 1;
else
    if [ -f "$EX_BINDER" ] && [ -f "$EX_ASHMEM" ];
    then
        # LOAD ASHMEM MODULE #
        sudo modprobe ashmem_linux;
        
        # MOUNT BINDER #
        sudo modprobe binder_linux;
        if [! -f "/dev/binderfs" ];
        then
            mkdir /dev/binderfs;
        fi
        sudo mount -t binder binder /dev/binderfs;

        lsmod | grep -e ashmem_linux -e binder_linux;
        ls -alh /dev/binderfs /dev/ashmem;

    else
        echo "Your distribution dont support android/binder_linux";
    fi
fi

#TODO:
## Probably I must copy binder_linux.ko to this same folder what ashmam_linux ##
## Next modprobe binder_linux ? ##
## Or Mount ? ##
