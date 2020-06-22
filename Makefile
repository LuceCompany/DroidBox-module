install:
	chmod a+x install.sh
	chmod a+x uninstall.sh
	./install.sh

clean:
	rm -rf /etc/modules-load.d/anbox.conf
	rm -rf /lib/udev/rules.d/99-anbox.rules

distclean: clean

uninstall: clean
	./uninstall.sh
	sudo rm -rf /usr/src/anbox-ashmem-1

.PHONY: install clean distclean uninstall