##  Automake configuration for INN.
##
##  Each subdirectory has its own Automake configuration, which is added to
##  this top-level configuration.  However, this is done via include, not
##  through recursive make, so that make has a complete dependency tree.
##  Therefore, every included Makemodule.am must use paths relative to the
##  top of the tree, not the subdirectory it is in.
##
##  The name Makemodule.am was taken from util-linux, which uses a similar
##  construction.

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

##  Clean rules.

