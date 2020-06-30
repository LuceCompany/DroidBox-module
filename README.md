# Anbox Kernel Modules for Ubuntu based system

Ubuntu based system have build binder_linux in the kernel located kernel/drivers/android/`**`
This repository will check if our system has ashmen and binder kernel built in.
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
* `lsmod | grep -e ashmem_linux -e binder_linux`:

```
binder_linux          180224  0
ashmem_linux           20480  0
```
* `ls -alh /dev/binderfs /dev/ashmem`:
```
crw------- 1 root root 10, 57 cze 30 12:50 /dev/ashmem

/dev/binderfs:
razem 0
drwxr-xr-x  2 root root      0 cze 30 12:51 .
drwxr-xr-x 22 root root   4,6K cze 30 12:51 ..
crw-------  1 root root 510, 0 cze 30 12:51 binder-control
```

* To uninstall anbox-module
```sh
$ sudo make uninstall
```
