# Enable out DroidBox-modules (android drivers, default in linux kernel> = 5.0) in system and enabling it.

Project based on `Anbox` [orginal project](https://github.com/anbox)
Ubuntu based system have build binder_linux in the kernel located kernel/drivers/android/`**`
This repository will check if our system has ashmen and binder kernel built in. In Add Ashmem is enable for secure boot

# Install Instruction
Check install `dkms` and linux-headers in your system.
```sh
$ sudo apt list --installed | grep dkms
$ sudo apt list --installed | grep linux-headers
```
Package name for linux-headers varies on different distributions, e.g.
`linux-headers-**-**-generic` (Ubuntu)


* Run Makkefile script automate the installation DroidBox-module for ubuntu based system:
```sh
$ git clone https://github.com/LuceCompany/DroidBox-module.git
$ cd DroidBox-module
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

* For stop {ashmem,binder} in system 
```sh
$ sudo make clean
```
