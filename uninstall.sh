#!/usr/bin/env bash

set -e -x

if [ $(id -u) -ne 0 ];
then
    echo "You must be login as root";
    exit 1;
else
    sudo dkms remove anbox-ashmem/1 --all;
    echo "You must rebbot system to finish uninstall  dkms module"
fi
