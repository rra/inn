##  Currently just handles creation of the automatically generated header
##  files.  Eventually, rules for installing INN's header files will go
##  here.

include ../Makefile.global

top	      = ..

ALL	      = inn/portable-getaddrinfo.h inn/portable-getnameinfo.h \
		inn/portable-macros.h inn/portable-socket.h \
		inn/portable-stdbool.h inn/system.h inn/version.h

EXTRA	      = config.h inn/paths.h

all: $(ALL) $(EXTRA)

warnings: all

bootstrap:

clean:
	rm -f $(ALL)

clobber distclean maintclean: clean
	rm -f $(EXTRA)

depend:

profiled: all

$(EXTRA) $(FIXSCRIPT):
	@echo Run configure before running make.  See INSTALL for details.
	@exit 1


##  Build rules.

inn/portable-getaddrinfo.h: portable/getaddrinfo.h
	$(SED) 's/"portable\//"inn\/portable-/g' portable/getaddrinfo.h \
	  | $(SED) -e 's/"config\.h"/<inn\/defines.h>/g' \
	  > inn/portable-getaddrinfo.h

inn/portable-getnameinfo.h: portable/getnameinfo.h
	$(SED) 's/"portable\//"inn\/portable-/g' portable/getnameinfo.h \
	  | $(SED) -e 's/"config\.h"/<inn\/defines.h>/g' \
	  > inn/portable-getnameinfo.h

inn/portable-macros.h: portable/macros.h
	$(SED) 's/"portable\//"inn\/portable-/g' portable/macros.h \
	  > inn/portable-macros.h

inn/portable-socket.h: portable/socket.h
	$(SED) 's/"portable\//"inn\/portable-/g' portable/socket.h \
	  | $(SED) -e 's/HAVE_INET6/INN_HAVE_INET6/g' \
	           -e 's/"config\.h"/<inn\/defines.h>/g' \
	  > inn/portable-socket.h

inn/portable-stdbool.h: portable/stdbool.h
	$(SED) 's/"portable\//"inn\/portable-/g' portable/stdbool.h \
	  | $(SED) -e 's/HAVE__BOOL/INN_HAVE__BOOL/g' \
	           -e 's/HAVE_STDBOOL_H/INN_HAVE_STDBOOL_H/g' \
	           -e 's/"config\.h"/<inn\/defines.h>/g' \
	  > inn/portable-stdbool.h

inn/system.h: config.h $(top)/support/mksystem
	$(top)/support/mksystem $(AWK) config.h > $@

inn/version.h: $(top)/support/mkversion $(top)/Makefile.global
	$(top)/support/mkversion '$(VERSION)' '$(VERSION_EXTRA)' > $@


##  Installation rules.

install:
	$(top)/support/install-sh $(OWNER) -m 0755 -d $D$(PATHINCLUDE)/inn
	for F in inn/*.h ; do \
	    $(CP_RPUB) $$F $D$(PATHINCLUDE)/$$F ; \
	done
