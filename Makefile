install:
	chmod a+x check.sh
	./check.sh

clean:
	sudo umount /dev/binderfs
    sudo modprobe -r ashmem_linux
	sudo rm -rf /dev/binderfs

distclean: clean

.PHONY: install clean distclean