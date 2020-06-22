install:
	chmod a+x check.sh
	./check.sh

clean:

distclean: clean

uninstall: clean
	sudo umount /dev/binderfs
    sudo modprobe -r ashmem_linux
	sudo rm -rf /dev/binderfs

.PHONY: install clean distclean uninstall