#!/bin/sh
docker pull ubuntu:20.04
docker run -i -t -v $PWD:/anbox ubuntu:20.04 /anbox/scripts/clean-build.sh
