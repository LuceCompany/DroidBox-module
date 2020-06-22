#!/usr/bin/env bash

set -e -x

if [ $(id -u) -ne 0 ];
then
    echo "You must be login as root";
    exit 1;
else
    ummount /dev/binderfs;
    rm -rf /dev/binderfs;
fi
