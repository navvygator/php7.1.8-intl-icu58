srcdir = /home/ubuntu/icu/source/php-src/ext/intl
builddir = /home/ubuntu/icu/source/php-src/ext/intl
top_srcdir = /home/ubuntu/icu/source/php-src/ext/intl
top_builddir = /home/ubuntu/icu/source/php-src/ext/intl
EGREP = /bin/grep -E
SED = /bin/sed
CONFIGURE_COMMAND = './configure' '--with-php-config=/usr/bin/php-config' '--with-icu-dir=/home/ubuntu/icu58'
CONFIGURE_OPTIONS = '--with-php-config=/usr/bin/php-config' '--with-icu-dir=/home/ubuntu/icu58'
SHLIB_SUFFIX_NAME = so
SHLIB_DL_SUFFIX_NAME = so
ZEND_EXT_TYPE = zend_extension
RE2C = exit 0;
AWK = gawk
INTL_SHARED_LIBADD = -Wl,-rpath,/home/ubuntu/icu58/lib -L/home/ubuntu/icu58/lib -licui18n -licuuc -licudata -licuio
shared_objects_intl = php_intl.lo intl_error.lo intl_convert.lo intl_convertcpp.lo collator/collator.lo collator/collator_class.lo collator/collator_sort.lo collator/collator_convert.lo collator/collator_locale.lo collator/collator_compare.lo collator/collator_attr.lo collator/collator_create.lo collator/collator_is_numeric.lo collator/collator_error.lo common/common_error.lo common/common_enum.lo common/common_date.lo converter/converter.lo formatter/formatter.lo formatter/formatter_main.lo formatter/formatter_class.lo formatter/formatter_attr.lo formatter/formatter_data.lo formatter/formatter_format.lo formatter/formatter_parse.lo normalizer/normalizer.lo normalizer/normalizer_class.lo normalizer/normalizer_normalize.lo locale/locale.lo locale/locale_class.lo locale/locale_methods.lo dateformat/dateformat.lo dateformat/dateformat_class.lo dateformat/dateformat_attr.lo dateformat/dateformat_data.lo dateformat/dateformat_format.lo dateformat/dateformat_format_object.lo dateformat/dateformat_parse.lo dateformat/dateformat_create.lo dateformat/dateformat_attrcpp.lo dateformat/dateformat_helpers.lo msgformat/msgformat.lo msgformat/msgformat_attr.lo msgformat/msgformat_class.lo msgformat/msgformat_data.lo msgformat/msgformat_format.lo msgformat/msgformat_helpers.lo msgformat/msgformat_parse.lo grapheme/grapheme_string.lo grapheme/grapheme_util.lo resourcebundle/resourcebundle.lo resourcebundle/resourcebundle_class.lo resourcebundle/resourcebundle_iterator.lo transliterator/transliterator.lo transliterator/transliterator_class.lo transliterator/transliterator_methods.lo timezone/timezone_class.lo timezone/timezone_methods.lo calendar/calendar_class.lo calendar/calendar_methods.lo calendar/gregoriancalendar_methods.lo breakiterator/breakiterator_class.lo breakiterator/breakiterator_iterators.lo breakiterator/breakiterator_methods.lo breakiterator/rulebasedbreakiterator_methods.lo breakiterator/codepointiterator_internal.lo breakiterator/codepointiterator_methods.lo uchar/uchar.lo idn/idn.lo spoofchecker/spoofchecker_class.lo spoofchecker/spoofchecker.lo spoofchecker/spoofchecker_create.lo spoofchecker/spoofchecker_main.lo
PHP_PECL_EXTENSION = intl
PHP_MODULES = $(phplibdir)/intl.la
PHP_ZEND_EX =
all_targets = $(PHP_MODULES) $(PHP_ZEND_EX)
install_targets = install-modules install-headers
prefix = /usr
exec_prefix = $(prefix)
libdir = ${exec_prefix}/lib
prefix = /usr
phplibdir = /home/ubuntu/icu/source/php-src/ext/intl/modules
phpincludedir = /usr/include/php/20160303
CC = cc
CFLAGS = -g -O2
CFLAGS_CLEAN = $(CFLAGS)
CPP = cc -E
CPPFLAGS = -DHAVE_CONFIG_H
CXX = g++
CXXFLAGS = -g -O2
CXXFLAGS_CLEAN = $(CXXFLAGS)
EXTENSION_DIR = /usr/lib/php/20160303
PHP_EXECUTABLE = /usr/bin/php7.1
EXTRA_LDFLAGS =
EXTRA_LIBS =
INCLUDES = -I/usr/include/php/20160303 -I/usr/include/php/20160303/main -I/usr/include/php/20160303/TSRM -I/usr/include/php/20160303/Zend -I/usr/include/php/20160303/ext -I/usr/include/php/20160303/ext/date/lib -I/home/ubuntu/icu58/include
LFLAGS =
LDFLAGS =
SHARED_LIBTOOL =
LIBTOOL = $(SHELL) $(top_builddir)/libtool
SHELL = /bin/bash
INSTALL_HEADERS =
mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
INSTALL = $(top_srcdir)/build/shtool install -c
INSTALL_DATA = $(INSTALL) -m 644

DEFS = -DPHP_ATOM_INC -I$(top_builddir)/include -I$(top_builddir)/main -I$(top_srcdir)
COMMON_FLAGS = $(DEFS) $(INCLUDES) $(EXTRA_INCLUDES) $(CPPFLAGS) $(PHP_FRAMEWORKPATH)

all: $(all_targets) 
	@echo
	@echo "Build complete."
	@echo "Don't forget to run 'make test'."
	@echo

build-modules: $(PHP_MODULES) $(PHP_ZEND_EX)

build-binaries: $(PHP_BINARIES)

libphp$(PHP_MAJOR_VERSION).la: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(LIBTOOL) --mode=link $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -rpath $(phptempdir) $(EXTRA_LDFLAGS) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@
	-@$(LIBTOOL) --silent --mode=install cp $@ $(phptempdir)/$@ >/dev/null 2>&1

libs/libphp$(PHP_MAJOR_VERSION).bundle: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(CC) $(MH_BUNDLE_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_SAPI_OBJS:.lo=.o) $(PHP_FRAMEWORKS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@ && cp $@ libs/libphp$(PHP_MAJOR_VERSION).so

install: $(all_targets) $(install_targets)

install-sapi: $(OVERALL_TARGET)
	@echo "Installing PHP SAPI module:       $(PHP_SAPI)"
	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	-@if test ! -r $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME); then \
		for i in 0.0.0 0.0 0; do \
			if test -r $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME).$$i; then \
				$(LN_S) $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME).$$i $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME); \
				break; \
			fi; \
		done; \
	fi
	@$(INSTALL_IT)

install-binaries: build-binaries $(install_binary_targets)

install-modules: build-modules
	@test -d modules && \
	$(mkinstalldirs) $(INSTALL_ROOT)$(EXTENSION_DIR)
	@echo "Installing shared extensions:     $(INSTALL_ROOT)$(EXTENSION_DIR)/"
	@rm -f modules/*.la >/dev/null 2>&1
	@$(INSTALL) modules/* $(INSTALL_ROOT)$(EXTENSION_DIR)

install-headers:
	-@if test "$(INSTALL_HEADERS)"; then \
		for i in `echo $(INSTALL_HEADERS)`; do \
			i=`$(top_srcdir)/build/shtool path -d $$i`; \
			paths="$$paths $(INSTALL_ROOT)$(phpincludedir)/$$i"; \
		done; \
		$(mkinstalldirs) $$paths && \
		echo "Installing header files:          $(INSTALL_ROOT)$(phpincludedir)/" && \
		for i in `echo $(INSTALL_HEADERS)`; do \
			if test "$(PHP_PECL_EXTENSION)"; then \
				src=`echo $$i | $(SED) -e "s#ext/$(PHP_PECL_EXTENSION)/##g"`; \
			else \
				src=$$i; \
			fi; \
			if test -f "$(top_srcdir)/$$src"; then \
				$(INSTALL_DATA) $(top_srcdir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			elif test -f "$(top_builddir)/$$src"; then \
				$(INSTALL_DATA) $(top_builddir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			else \
				(cd $(top_srcdir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i; \
				cd $(top_builddir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i) 2>/dev/null || true; \
			fi \
		done; \
	fi

PHP_TEST_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1'
PHP_TEST_SHARED_EXTENSIONS =  ` \
	if test "x$(PHP_MODULES)" != "x"; then \
		for i in $(PHP_MODULES)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
		done; \
	fi; \
	if test "x$(PHP_ZEND_EX)" != "x"; then \
		for i in $(PHP_ZEND_EX)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d $(ZEND_EXT_TYPE)=$(top_builddir)/modules/$$dlname"; \
		done; \
	fi`
PHP_DEPRECATED_DIRECTIVES_REGEX = '^(magic_quotes_(gpc|runtime|sybase)?|(zend_)?extension(_debug)?(_ts)?)[\t\ ]*='

test: all
	@if test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
		INI_FILE=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r 'echo php_ini_loaded_file();' 2> /dev/null`; \
		if test "$$INI_FILE"; then \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_FILE" > $(top_builddir)/tmp-php.ini; \
		else \
			echo > $(top_builddir)/tmp-php.ini; \
		fi; \
		INI_SCANNED_PATH=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r '$$a = explode(",\n", trim(php_ini_scanned_files())); echo $$a[0];' 2> /dev/null`; \
		if test "$$INI_SCANNED_PATH"; then \
			INI_SCANNED_PATH=`$(top_srcdir)/build/shtool path -d $$INI_SCANNED_PATH`; \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_SCANNED_PATH"/*.ini >> $(top_builddir)/tmp-php.ini; \
		fi; \
		TEST_PHP_EXECUTABLE=$(PHP_EXECUTABLE) \
		TEST_PHP_SRCDIR=$(top_srcdir) \
		CC="$(CC)" \
			$(PHP_EXECUTABLE) -n -c $(top_builddir)/tmp-php.ini $(PHP_TEST_SETTINGS) $(top_srcdir)/run-tests.php -n -c $(top_builddir)/tmp-php.ini -d extension_dir=$(top_builddir)/modules/ $(PHP_TEST_SHARED_EXTENSIONS) $(TESTS); \
		TEST_RESULT_EXIT_CODE=$$?; \
		rm $(top_builddir)/tmp-php.ini; \
		exit $$TEST_RESULT_EXIT_CODE; \
	else \
		echo "ERROR: Cannot run tests without CLI sapi."; \
	fi

clean:
	find . -name \*.gcno -o -name \*.gcda | xargs rm -f
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f 
	find . -name \*.so | xargs rm -f
	find . -name .libs -a -type d|xargs rm -rf
	rm -f libphp$(PHP_MAJOR_VERSION).la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_MILTER_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*

distclean: clean
	rm -f Makefile config.cache config.log config.status Makefile.objects Makefile.fragments libtool main/php_config.h main/internal_functions_cli.c main/internal_functions.c stamp-h sapi/apache/libphp$(PHP_MAJOR_VERSION).module sapi/apache_hooks/libphp$(PHP_MAJOR_VERSION).module buildmk.stamp Zend/zend_dtrace_gen.h Zend/zend_dtrace_gen.h.bak Zend/zend_config.h TSRM/tsrm_config.h
	rm -f php7.spec main/build-defs.h scripts/phpize
	rm -f ext/date/lib/timelib_config.h ext/mbstring/oniguruma/config.h ext/mbstring/libmbfl/config.h ext/oci8/oci8_dtrace_gen.h ext/oci8/oci8_dtrace_gen.h.bak
	rm -f scripts/man1/phpize.1 scripts/php-config scripts/man1/php-config.1 sapi/cli/php.1 sapi/cgi/php-cgi.1 ext/phar/phar.1 ext/phar/phar.phar.1
	rm -f sapi/fpm/php-fpm.conf sapi/fpm/init.d.php-fpm sapi/fpm/php-fpm.service sapi/fpm/php-fpm.8 sapi/fpm/status.html
	rm -f ext/iconv/php_have_bsd_iconv.h ext/iconv/php_have_glibc_iconv.h ext/iconv/php_have_ibm_iconv.h ext/iconv/php_have_iconv.h ext/iconv/php_have_libiconv.h ext/iconv/php_iconv_aliased_libiconv.h ext/iconv/php_iconv_supports_errno.h ext/iconv/php_php_iconv_h_path.h ext/iconv/php_php_iconv_impl.h
	rm -f ext/phar/phar.phar ext/phar/phar.php
	if test "$(srcdir)" != "$(builddir)"; then \
	  rm -f ext/phar/phar/phar.inc; \
	fi
	$(EGREP) define'.*include/php' $(top_srcdir)/configure | $(SED) 's/.*>//'|xargs rm -f

prof-gen:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-generate all

prof-clean:
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f 
	find . -name \*.so | xargs rm -f
	rm -f libphp$(PHP_MAJOR_VERSION).la $(SAPI_CLI_PATH) $(SAPI_CGI_PATH) $(SAPI_MILTER_PATH) $(SAPI_LITESPEED_PATH) $(SAPI_FPM_PATH) $(OVERALL_TARGET) modules/* libs/*

prof-use:
	CCACHE_DISABLE=1 $(MAKE) PROF_FLAGS=-fprofile-use all


.PHONY: all clean install distclean test prof-gen prof-clean prof-use
.NOEXPORT:
php_intl.lo: /home/ubuntu/icu/source/php-src/ext/intl/php_intl.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/php_intl.c -o php_intl.lo 
intl_error.lo: /home/ubuntu/icu/source/php-src/ext/intl/intl_error.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/intl_error.c -o intl_error.lo 
intl_convert.lo: /home/ubuntu/icu/source/php-src/ext/intl/intl_convert.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/intl_convert.c -o intl_convert.lo 
intl_convertcpp.lo: /home/ubuntu/icu/source/php-src/ext/intl/intl_convertcpp.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/intl_convertcpp.cpp -o intl_convertcpp.lo 
collator/collator.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator.c -o collator/collator.lo 
collator/collator_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_class.c -o collator/collator_class.lo 
collator/collator_sort.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_sort.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_sort.c -o collator/collator_sort.lo 
collator/collator_convert.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_convert.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_convert.c -o collator/collator_convert.lo 
collator/collator_locale.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_locale.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_locale.c -o collator/collator_locale.lo 
collator/collator_compare.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_compare.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_compare.c -o collator/collator_compare.lo 
collator/collator_attr.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_attr.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_attr.c -o collator/collator_attr.lo 
collator/collator_create.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_create.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_create.c -o collator/collator_create.lo 
collator/collator_is_numeric.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_is_numeric.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_is_numeric.c -o collator/collator_is_numeric.lo 
collator/collator_error.lo: /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_error.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/collator/collator_error.c -o collator/collator_error.lo 
common/common_error.lo: /home/ubuntu/icu/source/php-src/ext/intl/common/common_error.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/common/common_error.c -o common/common_error.lo 
common/common_enum.lo: /home/ubuntu/icu/source/php-src/ext/intl/common/common_enum.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/common/common_enum.cpp -o common/common_enum.lo 
common/common_date.lo: /home/ubuntu/icu/source/php-src/ext/intl/common/common_date.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/common/common_date.cpp -o common/common_date.lo 
converter/converter.lo: /home/ubuntu/icu/source/php-src/ext/intl/converter/converter.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/converter/converter.c -o converter/converter.lo 
formatter/formatter.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter.c -o formatter/formatter.lo 
formatter/formatter_main.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_main.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_main.c -o formatter/formatter_main.lo 
formatter/formatter_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_class.c -o formatter/formatter_class.lo 
formatter/formatter_attr.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_attr.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_attr.c -o formatter/formatter_attr.lo 
formatter/formatter_data.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_data.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_data.c -o formatter/formatter_data.lo 
formatter/formatter_format.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_format.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_format.c -o formatter/formatter_format.lo 
formatter/formatter_parse.lo: /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_parse.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/formatter/formatter_parse.c -o formatter/formatter_parse.lo 
normalizer/normalizer.lo: /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer.c -o normalizer/normalizer.lo 
normalizer/normalizer_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer_class.c -o normalizer/normalizer_class.lo 
normalizer/normalizer_normalize.lo: /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer_normalize.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/normalizer/normalizer_normalize.c -o normalizer/normalizer_normalize.lo 
locale/locale.lo: /home/ubuntu/icu/source/php-src/ext/intl/locale/locale.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/locale/locale.c -o locale/locale.lo 
locale/locale_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/locale/locale_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/locale/locale_class.c -o locale/locale_class.lo 
locale/locale_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/locale/locale_methods.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/locale/locale_methods.c -o locale/locale_methods.lo 
dateformat/dateformat.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat.c -o dateformat/dateformat.lo 
dateformat/dateformat_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_class.c -o dateformat/dateformat_class.lo 
dateformat/dateformat_attr.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_attr.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_attr.c -o dateformat/dateformat_attr.lo 
dateformat/dateformat_data.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_data.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_data.c -o dateformat/dateformat_data.lo 
dateformat/dateformat_format.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_format.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_format.c -o dateformat/dateformat_format.lo 
dateformat/dateformat_format_object.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_format_object.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_format_object.cpp -o dateformat/dateformat_format_object.lo 
dateformat/dateformat_parse.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_parse.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_parse.c -o dateformat/dateformat_parse.lo 
dateformat/dateformat_create.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_create.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_create.cpp -o dateformat/dateformat_create.lo 
dateformat/dateformat_attrcpp.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_attrcpp.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_attrcpp.cpp -o dateformat/dateformat_attrcpp.lo 
dateformat/dateformat_helpers.lo: /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_helpers.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/dateformat/dateformat_helpers.cpp -o dateformat/dateformat_helpers.lo 
msgformat/msgformat.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat.c -o msgformat/msgformat.lo 
msgformat/msgformat_attr.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_attr.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_attr.c -o msgformat/msgformat_attr.lo 
msgformat/msgformat_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_class.c -o msgformat/msgformat_class.lo 
msgformat/msgformat_data.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_data.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_data.c -o msgformat/msgformat_data.lo 
msgformat/msgformat_format.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_format.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_format.c -o msgformat/msgformat_format.lo 
msgformat/msgformat_helpers.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_helpers.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_helpers.cpp -o msgformat/msgformat_helpers.lo 
msgformat/msgformat_parse.lo: /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_parse.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/msgformat/msgformat_parse.c -o msgformat/msgformat_parse.lo 
grapheme/grapheme_string.lo: /home/ubuntu/icu/source/php-src/ext/intl/grapheme/grapheme_string.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/grapheme/grapheme_string.c -o grapheme/grapheme_string.lo 
grapheme/grapheme_util.lo: /home/ubuntu/icu/source/php-src/ext/intl/grapheme/grapheme_util.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/grapheme/grapheme_util.c -o grapheme/grapheme_util.lo 
resourcebundle/resourcebundle.lo: /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle.c -o resourcebundle/resourcebundle.lo 
resourcebundle/resourcebundle_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle_class.c -o resourcebundle/resourcebundle_class.lo 
resourcebundle/resourcebundle_iterator.lo: /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle_iterator.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/resourcebundle/resourcebundle_iterator.c -o resourcebundle/resourcebundle_iterator.lo 
transliterator/transliterator.lo: /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator.c -o transliterator/transliterator.lo 
transliterator/transliterator_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator_class.c -o transliterator/transliterator_class.lo 
transliterator/transliterator_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator_methods.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/transliterator/transliterator_methods.c -o transliterator/transliterator_methods.lo 
timezone/timezone_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/timezone/timezone_class.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/timezone/timezone_class.cpp -o timezone/timezone_class.lo 
timezone/timezone_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/timezone/timezone_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/timezone/timezone_methods.cpp -o timezone/timezone_methods.lo 
calendar/calendar_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/calendar/calendar_class.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/calendar/calendar_class.cpp -o calendar/calendar_class.lo 
calendar/calendar_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/calendar/calendar_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/calendar/calendar_methods.cpp -o calendar/calendar_methods.lo 
calendar/gregoriancalendar_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/calendar/gregoriancalendar_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/calendar/gregoriancalendar_methods.cpp -o calendar/gregoriancalendar_methods.lo 
breakiterator/breakiterator_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_class.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_class.cpp -o breakiterator/breakiterator_class.lo 
breakiterator/breakiterator_iterators.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_iterators.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_iterators.cpp -o breakiterator/breakiterator_iterators.lo 
breakiterator/breakiterator_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/breakiterator_methods.cpp -o breakiterator/breakiterator_methods.lo 
breakiterator/rulebasedbreakiterator_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/rulebasedbreakiterator_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/rulebasedbreakiterator_methods.cpp -o breakiterator/rulebasedbreakiterator_methods.lo 
breakiterator/codepointiterator_internal.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/codepointiterator_internal.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/codepointiterator_internal.cpp -o breakiterator/codepointiterator_internal.lo 
breakiterator/codepointiterator_methods.lo: /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/codepointiterator_methods.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/breakiterator/codepointiterator_methods.cpp -o breakiterator/codepointiterator_methods.lo 
uchar/uchar.lo: /home/ubuntu/icu/source/php-src/ext/intl/uchar/uchar.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/uchar/uchar.c -o uchar/uchar.lo 
idn/idn.lo: /home/ubuntu/icu/source/php-src/ext/intl/idn/idn.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/idn/idn.c -o idn/idn.lo 
spoofchecker/spoofchecker_class.lo: /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_class.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_class.c -o spoofchecker/spoofchecker_class.lo 
spoofchecker/spoofchecker.lo: /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker.c -o spoofchecker/spoofchecker.lo 
spoofchecker/spoofchecker_create.lo: /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_create.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_create.c -o spoofchecker/spoofchecker_create.lo 
spoofchecker/spoofchecker_main.lo: /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_main.c
	$(LIBTOOL) --mode=compile $(CC) -I/home/ubuntu/icu58/include  -Wno-write-strings -D__STDC_LIMIT_MACROS -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -I. -I/home/ubuntu/icu/source/php-src/ext/intl $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS)  -c /home/ubuntu/icu/source/php-src/ext/intl/spoofchecker/spoofchecker_main.c -o spoofchecker/spoofchecker_main.lo 
$(phplibdir)/intl.la: ./intl.la
	$(LIBTOOL) --mode=install cp ./intl.la $(phplibdir)

./intl.la: $(shared_objects_intl) $(INTL_SHARED_DEPENDENCIES)
	$(LIBTOOL) --mode=link $(CXX) $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) -o $@ -export-dynamic -avoid-version -prefer-pic -module -rpath $(phplibdir) $(EXTRA_LDFLAGS) $(shared_objects_intl) $(INTL_SHARED_LIBADD)

