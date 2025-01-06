################################################################################
#
# netperf
#
################################################################################

NETPERF_VERSION = 3bc455b
NETPERF_SITE = $(call github,HewlettPackard,netperf,$(NETPERF_VERSION))
# gcc 5+ defaults to gnu99 which breaks netperf
NETPERF_CONF_ENV = \
	ac_cv_func_setpgrp_void=set \
	CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
NETPERF_CONF_OPTS = --enable-demo=yes
NETPERF_LICENSE = MIT
NETPERF_LICENSE_FILES = COPYING

define NETPERF_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
NETPERF_PRE_CONFIGURE_HOOKS += NETPERF_RUN_AUTOGEN

define NETPERF_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/src/netperf \
		$(TARGET_DIR)/usr/bin/netperf
	$(INSTALL) -m 0755 $(@D)/src/netserver \
		$(TARGET_DIR)/usr/bin/netserver
endef

$(eval $(autotools-package))
