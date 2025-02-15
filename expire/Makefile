include ../Makefile.global

top           = ..
CFLAGS        = $(GCFLAGS)

ALL           = convdate expire expireover expirerm fastrm grephistory \
		makedbz makehistory prunehistory

SOURCES       = convdate.c expire.c expireover.c fastrm.c grephistory.c \
		makedbz.c makehistory.c prunehistory.c

all: $(ALL)

warnings:
	$(MAKE) COPT='$(WARNINGS)' all

install: all
	for F in convdate fastrm grephistory ; do \
	    $(LI_XPUB) $$F $D$(PATHBIN)/$$F ; \
	done
	for F in expire expireover makedbz makehistory prunehistory ; do \
	    $(LI_XPRI) $$F $D$(PATHBIN)/$$F ; \
	done
	$(CP_XPRI) expirerm $D$(PATHBIN)/expirerm

bootstrap:

clean clobber distclean maintclean:
	rm -f *.o $(ALL)
	rm -f profiled expirep
	rm -rf .libs


##  Compilation rules.

BOTH		= $(LIBSTORAGE) $(LIBHIST) $(LIBINN)

LINK            = $(LIBLD) $(LDFLAGS) -o $@
INNLIBS		= $(LIBINN) $(LIBS)
STORELIBS	= $(BOTH) $(STORAGE_LIBS) $(LIBS)

FIX             = $(FIXSCRIPT)

$(FIXSCRIPT):
	@echo Run configure before running make.  See INSTALL for details.
	@exit 1

convdate:	convdate.o     $(LIBINN) ; $(LINK) convdate.o     $(INNLIBS)
expire:		expire.o       $(BOTH)   ; $(LINK) expire.o       $(STORELIBS)
expireover:	expireover.o   $(BOTH)   ; $(LINK) expireover.o   $(STORELIBS)
fastrm:		fastrm.o       $(BOTH)   ; $(LINK) fastrm.o       $(STORELIBS)
grephistory:	grephistory.o  $(BOTH)   ; $(LINK) grephistory.o  $(STORELIBS)
makedbz:	makedbz.o      $(LIBINN) ; $(LINK) makedbz.o      $(INNLIBS)
makehistory:	makehistory.o  $(BOTH)   ; $(LINK) makehistory.o  $(STORELIBS)
prunehistory:	prunehistory.o $(BOTH)   ; $(LINK) prunehistory.o $(STORELIBS)

expirerm:	expirerm.in    $(FIX)    ; $(FIX) expirerm.in

$(LIBINN):	; (cd ../lib ; $(MAKE))
$(LIBSTORAGE):	; (cd ../storage ; $(MAKE))
$(LIBHIST):	; (cd ../history ; $(MAKE))


##  Profiling.  These rules have not been checked for a while and may need
##  some work.

profiled:	expirep 
	date >$@

expirep:	expire.c
	rm -f expire.o
	$(MAKEPROFILING) expire
	mv expire expirep
	rm -f expire.o


##  Dependencies.  Default list, below, is probably good enough.

depend:	Makefile $(SOURCES)
	$(MAKEDEPEND) '$(CFLAGS)' $(SOURCES)

# DO NOT DELETE THIS LINE -- make depend depends on it.
convdate.o: convdate.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/messages.h \
  ../include/inn/libinn.h ../include/inn/concat.h ../include/inn/xmalloc.h \
  ../include/inn/xwrite.h
expire.o: expire.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/history.h \
  ../include/inn/innconf.h ../include/inn/messages.h \
  ../include/inn/inndcomm.h ../include/inn/libinn.h \
  ../include/inn/concat.h ../include/inn/xmalloc.h ../include/inn/xwrite.h \
  ../include/inn/newsuser.h ../include/inn/paths.h \
  ../include/inn/storage.h ../include/inn/options.h
expireover.o: expireover.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/innconf.h \
  ../include/inn/libinn.h ../include/inn/concat.h ../include/inn/xmalloc.h \
  ../include/inn/xwrite.h ../include/inn/messages.h \
  ../include/inn/newsuser.h ../include/inn/ov.h ../include/inn/history.h \
  ../include/inn/storage.h ../include/inn/options.h ../include/inn/paths.h \
  ../include/inn/qio.h ../include/inn/storage.h
fastrm.o: fastrm.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/innconf.h \
  ../include/inn/messages.h ../include/inn/qio.h ../include/inn/libinn.h \
  ../include/inn/concat.h ../include/inn/xmalloc.h ../include/inn/xwrite.h \
  ../include/inn/storage.h ../include/inn/options.h
grephistory.o: grephistory.c ../include/clibrary.h ../include/config.h \
  ../include/inn/defines.h ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h \
  ../include/inn/macros.h ../include/portable/stdbool.h \
  ../include/inn/history.h ../include/inn/innconf.h \
  ../include/inn/messages.h ../include/inn/libinn.h \
  ../include/inn/concat.h ../include/inn/xmalloc.h ../include/inn/xwrite.h \
  ../include/inn/paths.h ../include/inn/storage.h ../include/inn/options.h
makedbz.o: makedbz.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/dbz.h \
  ../include/inn/libinn.h ../include/inn/concat.h ../include/inn/xmalloc.h \
  ../include/inn/xwrite.h ../include/inn/innconf.h \
  ../include/inn/messages.h ../include/inn/newsuser.h \
  ../include/inn/paths.h ../include/inn/qio.h ../include/inn/storage.h \
  ../include/inn/options.h
makehistory.o: makehistory.c ../include/config.h ../include/inn/defines.h \
  ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/buffer.h \
  ../include/inn/history.h ../include/inn/innconf.h \
  ../include/inn/libinn.h ../include/inn/concat.h ../include/inn/xmalloc.h \
  ../include/inn/xwrite.h ../include/inn/messages.h \
  ../include/inn/newsuser.h ../include/inn/ov.h ../include/inn/storage.h \
  ../include/inn/options.h ../include/inn/overview.h \
  ../include/inn/storage.h ../include/inn/paths.h ../include/inn/qio.h \
  ../include/inn/vector.h ../include/inn/wire.h
prunehistory.o: prunehistory.c ../include/config.h \
  ../include/inn/defines.h ../include/inn/system.h ../include/inn/macros.h \
  ../include/inn/portable-macros.h ../include/inn/portable-stdbool.h \
  ../include/inn/defines.h ../include/inn/options.h ../include/clibrary.h \
  ../include/config.h ../include/inn/macros.h \
  ../include/portable/stdbool.h ../include/inn/history.h \
  ../include/inn/innconf.h ../include/inn/messages.h \
  ../include/inn/libinn.h ../include/inn/concat.h ../include/inn/xmalloc.h \
  ../include/inn/xwrite.h ../include/inn/paths.h
