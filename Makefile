install:
	chmod a+x check.sh
	./check.sh

clean:

distclean: clean

uninstall: clean
	./uninstall.sh

.PHONY: install clean distclean uninstall