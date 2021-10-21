##  Automake configuration for INN.

##  This version information is used to generate include/inn/version.h and is
##  used by INN for banner and local version identification.  The version
##  identification string will be "$VERSION ($VERSION_EXTRA)", with the
##  parentheses omitted if $VERSION_EXTRA is empty (as it is for major
##  releases).  If you make extensive local modifications to INN, you can
##  put your own version information in $VERSION_EXTRA.  If it's set to
##  "prerelease", the build time will be automatically included.
##      If you modify these two strings, you must encode them in UTF-8
##      (using only US-ASCII characters is consequently also fine) and
##      keep their length reasonable; otherwise, your news server will not
##      be complying with the NNTP protocol.

VERSION         = 2.7.0
VERSION_EXTRA   = prerelease

##  Shared library versions.  These versions should be increased with every
##  change to the library source following the rules laid out in the libtool
##  manual.  This will also force the file name of the shared library to
##  change so that one can recover from make update.  We can't use .OLD
##  extensions for the shared library since ldconfig will think .OLD sorts
##  after the regular library and will point the binaries at the old
##  library.

LIBINN_VERSION     = 6:1:0
LIBINNHIST_VERSION = 3:4:0
LIBSTORAGE_VERSION = 3:4:0

##  Paths and command lines for programs used only by the maintainers to
##  regenerate dependencies, documentation, and the like.

POD2MAN         = pod2man -c 'InterNetNews Documentation' -r 'INN $(VERSION)'
POD2TEXT        = pod2text -s -l

##  Header files for all internal libraries are in include.
##  $(builddir)/include is included automatically since that's where
##  config.h is generated.

AM_CPPFLAGS	= -I$(srcdir)/include

##  Source files that need to be constructed before anything else can be
##  built.

BUILT_SOURCES = include/inn/portable-getaddrinfo.h			 \
	include/inn/portable-getnameinfo.h include/inn/portable-macros.h \
	include/inn/portable-socket.h include/inn/portable-stdbool.h	 \
	include/inn/system.h include/inn/version.h

##  include

innincludedir = $(includedir)/inn
inninclude_HEADERS = include/inn/buffer.h include/inn/concat.h		  \
	include/inn/confparse.h include/inn/dbz.h include/inn/dispatch.h  \
	include/inn/fdflag.h include/inn/hashtab.h include/inn/fdflag.h	  \
	include/inn/hashtab.h include/inn/history.h include/inn/history.h \
	include/inn/innconf.h include/inn/inndcomm.h include/inn/libinn.h \
	include/inn/list.h include/inn/macros.h include/inn/md5.h	  \
	include/inn/messages.h include/inn/mmap.h			  \
	include/inn/network-innbind.h include/inn/network.h		  \
	include/inn/newsuser.h include/inn/nntp.h include/inn.options.h	  \
	include/inn/ov.h include/inn/overview.h include/inn/paths.h	  \
	include/inn/portable-getaddrinfo.h				  \
	include/inn/portable-getnameinfo.h include/inn/portable-macros.h  \
	include/inn/portable-socket.h include/inn/portable-stdbool.h	  \
	include/inn/qio.h include/inn/sequence.h include/inn/storage.h	  \
	include/inn/system.h include/inn/timer.h include/inn/tst.h	  \
	include/inn/utility.h include/inn/vector.h include/inn/version.h  \
	include/inn/wire.h include/inn/xmalloc.h include/inn/xwrite.h

include/inn/portable-getaddrinfo.h: include/portable/getaddrinfo.h
	$(SED) -e 's/"portable\//"inn\/portable-/g' -e '/"config\.h"/d' \
	    include/portable/getaddrinfo.h > $@

include/inn/portable-getnameinfo.h: include/portable/getnameinfo.h
	$(SED) -e 's/"portable\//"inn\/portable-/g' -e '/"config\.h"/d' \
	    include/portable/getnameinfo.h > $@

include/inn/portable-macros.h: include/portable/macros.h
	$(SED) 's/"portable\//"inn\/portable-/g' include/portable/macros.h > $@

include/inn/portable-socket.h: include/portable/socket.h
	$(SED) -e 's/"portable\//"inn\/portable-/g' -e '/"config\.h"/d'\
	    include/portable/socket.h > $@

include/inn/portable-stdbool.h: include/portable/stdbool.h
	$(SED) -e 's/"portable\//"inn\/portable-/g'		\
	       -e 's/HAVE__BOOL/INN_HAVE__BOOL/g'		\
	       -e 's/HAVE_STDBOOL_H/INN_HAVE_STDBOOL_H/g'	\
	    include/portable/stdbool.h > $@

include/inn/system.h: include/config.h $(srcdir)/support/mksystem
	$(srcdir)/support/mksystem $(AWK) config.h > $@

include/inn/version.h: $(srcdir)/support/mkversion $(buildir)/Makefile
	$(srcdir)/support/mkversion '$(VERSION)' '$(VERSION_EXTRA)' > $@


##  lib

lib_LTLIBRARIES = lib/libinn.la storage/libstorage.la history/libinnhist.la
lib_libinn_la_SOURCES = include/conffile.h include/innperl.h		   \
	include/portable/getaddrinfo.h include/portable/getnameinfo.h	   \
	include/portable/macros.h include/portable/mmap.h		   \
	include/portable/sd-daemon.h include/portable/setproctitle.h	   \
	include/portable/socket-unix.h include/portable/socket.h	   \
	include/portable/stdbool.h include/portable/system.h		   \
	include/portable/uio.h lib/argparse.c lib/artnumber.c lib/buffer.c \
	lib/cleanfrom.c lib/clientactive.c lib/clientlib.c lib/commands.c  \
	lib/concat.c lib/conffile.c lib/confparse.c lib/daemonize.c	   \
	lib/date.c lib/dbz.c lib/defdist.c lib/dispatch.c lib/fdflag.c	   \
	lib/fdlimit.c lib/getfqdn.c lib/getmodaddr.c lib/hash.c		   \
	lib/hashtab.c lib/headers.c lib/hex.c lib/innconf.c lib/inndcomm.c \
	lib/list.c lib/localopen.c lib/lockfile.c lib/makedir.c lib/md5.c  \
	lib/messageid.c lib/messages.c lib/mmap.c lib/network.c		   \
	lib/network-innbind.c lib/newsuser.c lib/nntp.c lib/qio.c	   \
	lib/radix32.c lib/readin.c lib/remopen.c lib/reservedfd.c	   \
	lib/resource.c lib/sendarticle.c lib/sendpass.c lib/sequence.c	   \
	lib/timer.c lib/tst.c lib/uwildmat.c lib/vector.c lib/wire.c	   \
	lib/xfopena.c lib/xmalloc.c lib/xsignal.c lib/xwrite.c
lib_libinn_la_LDFLAGS = -version-info $(LIBINN_VERSION)
lib_libinn_la_LIBADD = $(LTLIBOBJS)
noinst_LTLIBRARIES = lib/perl.la
lib_perl_la_SOURCES = include/ppport.h lib/perl.c
lib_perl_la_CPPFLAGS = $(PERL_CPPFLAGS) $(AM_CPPFLAGS)
lib_perl_la_LDFLAGS = $(PERL_LIBS)


##  history

history_libinnhist_la_SOURCES = history/his.c history/hismethods.c \
	history/hisv6/hisv6.c
history_libinnhist_la_CPPFLAGS = -I$(srcdir)/history
history_libinnhist_la_LDFLAGS = -version-info $(LIBINNHIST_VERSION)
history_libinnhist_la_LIBADD = storage/libstorage.la lib/libinn.la


##  storage

storage_libstorage_la_SOURCES = storage/buffindexed/buffindexed.c	 \
	storage/buffindexed/shmem.c storage/cnfs/cnfs.c storage/expire.c \
	storage/interface.c storage/ov.c storage/ovdb/ovdb.c		 \
	storage/overdata.c storage/overview.c storage/ovmethods.c	 \
	storage/ovsqlite/ovsqlite-private.c storage/ovsqlite/ovsqlite.c	 \
	storage/timecaf/caf.c storage/timecaf/timecaf.c			 \
	storage/timehash/timehash.c storage/tradindexed/tdx-cache.c	 \
	storage/tradindexed/tdx-data.c storage/tradindexed/tdx-group.c	 \
	storage/tradindexed/tradindexed.c storage/tradspool/tradspool.c	 \
	storage/trash/trash.c
storage_libstorage_la_CPPFLAGS = -I$(srcdir)/storage $(BDB_CPPFLAGS) \
	$(ZLIB_CPPFLAGS) $(AM_CPPFLAGS)
storage_libstorage_la_LDFLAGS = -version-info $(LIBSTORAGE_VERSION) \
	$(BDB_LDFLAGS) $(ZLIB_LDFLAGS) $(AM_LDFLAGS)
storage_libstorage_la_LIBADD = lib/libinn.la $(BDB_LIBS) $(ZLIB_LIBS)


##  innd

bin_PROGRAMS = innd/innd innd/tinyleaf
innd_innd_SOURCES = innd/art.c innd/cc.c innd/chan.c innd/icd.c innd/innd.c \
	innd/innd.h innd/keywords.c innd/lc.c innd/nc.c innd/newsfeeds.c    \
	innd/ng.c innd/proc.c innd/rc.c innd/site.c innd/status.c	    \
	innd/util.c innd/wip.c
innd_innd_CFLAGS = $(SYSTEMD_CFLAGS) $(AM_CFLAGS)
innd_innd_LIBADD = innd/perl.la innd/python.la history/libinnhist.la	    \
	storage/libstorage.la lib/libinn.la $(SYSTEMD_LIBS) $(REGEX_LIBS)
noinst_LTLIBRARIES += innd/perl.la innd/python.la
innd_perl_la_SOURCES = innd/perl.c
innd_perl_la_CPPFLAGS = $(PERL_CPPFLAGS) $(AM_CPPFLAGS)
innd_perl_la_LIBADD = lib/perl.la $(PERL_LIBS)
innd_python_la_SOURCES = innd/python.c
innd_python_la_CPPFLAGS = $(PYTHON_CPPFLAGS) $(AM_CPPFLAGS)
innd_python_la_LIBADD = $(PYTHON_LIBS)
innd_tinyleaf_SOURCES = tinyleaf.c
innd_tinyleaf_LIBADD = lib/libinn.la


##  nnrpd

bin_PROGRAMS += nnrpd/nnrpd
nnrpd_nnrpd_SOURCES = nnrpd/article.c nnrpd/auth-ext.c nnrpd/cache.c	  \
	nnrpd/cache.h nnrpd/commands.c nnrpd/group.c nnrpd/line.c	  \
	nnrpd/list.c nnrpd/misc.c nnrpd/newnews.c nnrpd/nnrpd.c		  \
	nnrpd/nnrpd.h nnrpd/perm.c nnrpd/post.c nnrpd/post.h nnrpd/sasl.c \
	nnrpd/tls.c nnrpd/tls.h nnrpd/track.c nnrpd/zlib.c
nnrpd_nnrpd_CPPFLAGS = $(OPENSSL_CPPFLAGS) $(SASL_CPPFLAGS) $(ZLIB_CPPFLAGS) \
	$(AM_CPPFLAGS)
nnrpd_nnrpd_LDFLAGS = $(OPENSSL_LDFLAGS) $(SASL_LDFLAGS) $(ZLIB_LDFLAGS) \
	$(AM_LDFLAGS)
nnrpd_nnrpd_LIBADD = nnrpd/perl.la nnrpd/python.la history/libinnhist.la \
	storage/libstorage.la lib/libinn.la $(SASL_LIBS) $(OPENSSL_LIBS) \
	$(CRYPTO_LIBS) $(ZLIB_LIBS)
noinst_LTLIBRARIES += nnrpd/perl.la nnrpd/python.la
nnrpd_perl_la_SOURCES = nnrpd/perl.c
nnrpd_perl_la_CPPFLAGS = $(PERL_CPPFLAGS) $(AM_CPPFLAGS)
nnrpd_perl_la_LIBADD = lib/perl.la $(PERL_LIBS)
nnrpd_python_la_SOURCES = nnrpd/python.c
nnrpd_python_la_CPPFLAGS = $(PYTHON_CPPFLAGS) $(AM_CPPFLAGS)
nnrpd_python_la_LIBADD = $(PYTHON_LIBS)


##  Clean rules.

CLEANFILES = include/inn/portable-getaddrinfo.h				 \
	include/inn/portable-getnameinfo.h include/inn/portable-macros.h \
	include/inn/portable-socket.h include/inn/portable-stdbool.h	 \
	include/inn/system.h include/inn/version.h
