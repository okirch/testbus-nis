
bindir	= /usr/bin
testdir	= /usr/share/testbus/suites

CFLAGS	= -Wall -O2
APPS	= 
SCRIPTS	= testbus/nis \
	  testbus/nis.functions \
	  testbus/nis.conf

all: $(APPS)

install: $(APPS)
	install -m 755 -d $(DESTDIR)$(bindir)
	if test -n "$(APPS)"; then \
		install -m 555 $(APPS) $(DESTDIR)$(bindir); \
	fi
	install -m 755 -d $(DESTDIR)$(testdir)
	install -m 555 $(SCRIPTS) $(DESTDIR)$(testdir)

obj/%.o: src/%.c
	@mkdir -p obj
	$(CC) $(CFLAGS) -c -o $@ $<

%: obj/%.o
	$(CC) -o $@ $< -lpthread

clean:
	rm -rf obj $(APPS)
