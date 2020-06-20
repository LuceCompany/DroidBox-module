[![Build Status](https://travis-ci.org/anbox/anbox-modules.svg?branch=master)](https://travis-ci.org/anbox/anbox-modules)

# Anbox Kernel Modules for Ubuntu based system

Ubuntu based system have build binder_linux in the kernel located kernel/drivers/android/`**`
This repository contains the kernel modules necessary to run the Anbox
Android container runtime. They're split out of the original Anbox
repository to make packaging in various Linux distributions easier.
# Install Instruction
Check install `dkms` and linux-headers on your system.
```sh
$ sudo apt list --installed | grep dkms
$ sudo apt list --installed | grep linux-headers
```
Package name for linux-headers varies on different distributions, e.g.
`linux-headers-**-**-generic` (Ubuntu)


* Run Makkefile script automate the installation anbox-module for ubuntu based system:
```sh
$ git clone https://github.com/LuceCompany/anbox-modules.git
$ cd anbox-modules
$ sudo make install
```
You are expected to see output like:

```
ashmem_linux           16384  0
crw-rw-rw- 1 root root  10, 55 Jun 19 16:30 /dev/ashmem
```

* To uninstall anbox-module
```sh
$ sudo make uninstall
```
