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
    if [ -f "$EX_BINDER" -f "$EX_ASHMEM" ];
    then
        if [ ! -f "/etc/modules-load.d/anbox.conf" ];
        then
            cp anbox.conf /etc/modules-load.d/;
        fi

        if [ ! -f "/lib/udev/rules.d/99-anbox.rules" ];
        then
            cp 99-anbox.rules /lib/udev/rules.d/;
        fi

        if [ ! -f "/usr/src/anbox-ashmem-1" ];
        then
            cp -rT ashmem /usr/src/anbox-ashmem-1;
            dkms install anbox-ashmem/1;
            modprobe ashmem_linux;
        fi

        lsmod | grep -e ashmem_linux;
        ls -alh /dev/ashmem;

    else
        echo "Your distribution dont support android/binder_linux";
    fi
fi

#TODO:
## Probably I must copy binder_linux.ko to this same folder what ashmam_linux ##
## Next modprobe binder_linux ? ##
## Or Mount ? ##
