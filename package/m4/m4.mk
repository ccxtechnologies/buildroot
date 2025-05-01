################################################################################
#
# m4
#
################################################################################

M4_VERSION = 1.4.19
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = $(BR2_GNU_MIRROR)/m4
M4_LICENSE = GPL-3.0+
M4_LICENSE_FILES = COPYING

# This should be removed with 1.4.20
HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"

$(eval $(host-autotools-package))
