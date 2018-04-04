.PHONY: all install test clean

all:

install:
	install -D -m 0755 ethester $(DESTDIR)/usr/bin/ethester

test:
	$(MAKE) -C test

clean:
	rm -f bash-completion
	$(MAKE) -C test $@

bash-completion: ethester
	register-python-argcomplete $< > $@
