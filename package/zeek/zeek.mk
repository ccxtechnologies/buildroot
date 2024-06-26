################################################################################
#
# zeek
#
################################################################################

ZEEK_VERSION = 5.2.2
ZEEK_SITE = https://download.zeek.org
ZEEK_LICENSE = \
	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
	Public Domain (sqlite), \
	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
	LGPL-3.0+ (Multifast Project), \
	BSD-2-Clause (event.h), \
	BSD-3-Clause (in_cksum.cc) \
	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
	Apache-2.0 (highwayhash, folly), \
	MPL-2.0 (mozilla-ca-list.zeek)
ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
ZEEK_CPE_ID_VENDOR = zeek
ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
ZEEK_DEPENDENCIES = \
	host-bison \
	host-flex \
	host-pkgconf \
	host-python3 \
	host-zeek \
	$(if $(BR2_PACKAGE_LIBKRB5),libkrb5) \
	$(if $(BR2_PACKAGE_LIBMAXMINDDB),libmaxminddb) \
	libpcap \
	openssl \
	$(if $(BR2_PACKAGE_ROCKSDB),rocksdb) \
	zlib
HOST_ZEEK_DEPENDENCIES = \
	host-bison \
	host-flex \
	host-pkgconf \
	host-python3 \
	host-libpcap \
	host-openssl \
	host-zlib

ZEEK_CONF_OPTS = \
	-DBIFCL_EXE_PATH=$(HOST_DIR)/bin/bifcl \
	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
	-DBROKER_DISABLE_DOCS=ON \
	-DBROKER_DISABLE_TESTS=ON \
	-DDISABLE_SPICY=ON \
	-DENABLE_ZEEK_UNIT_TESTS=OFF \
	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
	-DINSTALL_AUX_TOOLS=ON \
	-DZEEK_ETC_INSTALL_DIR=/etc

define ZEEK_BUILD_AUX
	$(TARGET_MAKE_ENV) $(ZEEK_BUILD_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) \
		--build $(ZEEK_BUILDDIR)/auxil/broker/caf $(ZEEK_INSTALL_TARGET_OPTS)
endef
ZEEK_POST_BUILD_HOOKS += ZEEK_BUILD_AUX

define ZEEK_INSTALL_AUX
	$(TARGET_MAKE_ENV) $(ZEEK_BUILD_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) \
		--install $(ZEEK_BUILDDIR)/auxil/zeek-aux $(ZEEK_INSTALL_TARGET_OPTS)
	$(TARGET_MAKE_ENV) $(ZEEK_BUILD_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) \
		--install $(ZEEK_BUILDDIR)/auxil/broker $(ZEEK_INSTALL_TARGET_OPTS)
	$(TARGET_MAKE_ENV) $(ZEEK_BUILD_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) \
		--install $(ZEEK_BUILDDIR)/auxil/broker/caf $(ZEEK_INSTALL_TARGET_OPTS)
endef
ZEEK_POST_INSTALL_TARGET_HOOKS += ZEEK_INSTALL_AUX

define ZEEK_FIX_PYTHON_PATH
	$(SED) 's,@PYTHON_EXECUTABLE@,/usr/bin/python,' \
		$(@D)/auxil/zeekctl/ZeekControl/ssh_runner.py
endef
ZEEK_POST_PATCH_HOOKS += ZEEK_FIX_PYTHON_PATH

ifeq ($(BR2_PACKAGE_JEMALLOC),y)
ZEEK_DEPENDENCIES += jemalloc
ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=ON
else
ZEEK_CONF_OPTS += -DENABLE_JEMALLOC=OFF
endif

ifeq ($(BR2_PACKAGE_ZEEK_ZEEKCTL),y)
ZEEK_DEPENDENCIES += host-swig python3
ZEEK_CONF_OPTS += \
	-DDISABLE_PYTHON_BINDINGS=OFF \
	-DINSTALL_ZEEKCTL=ON \
	-DPY_MOD_INSTALL_DIR=/usr/lib/zeekctl \
	-DZEEK_PYTHON_PREFIX=/usr
else
ZEEK_CONF_OPTS += \
	-DDISABLE_PYTHON_BINDINGS=ON \
	-DINSTALL_ZEEKCTL=OFF
endif

ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
ZEEK_DEPENDENCIES += musl-fts
ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
endif

HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam

define HOST_ZEEK_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
		$(HOST_DIR)/bin/bifcl
	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
		$(HOST_DIR)/bin/binpac
	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
		$(HOST_DIR)/bin/gen-zam
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
