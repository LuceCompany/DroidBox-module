install:
	chmod a+x check.sh
	./check.sh

clean:
	sudo umount /dev/binderfs
	sudo modprobe -r ashmem_linux
	sudo rm -rf /dev/binderfs
	if [ -f "/usr/lib/modules-load.d/droidbox.conf" ];
    then
        sudo rm -rf "/usr/lib/modules-load.d/droidbox.conf";
    fi

distclean: clean

.PHONY: install clean distclean