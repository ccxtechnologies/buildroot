################################################################################
#
# m4
#
################################################################################

M4_VERSION = 1.4.20
M4_SOURCE = m4-$(M4_VERSION).tar.xz
M4_SITE = $(BR2_GNU_MIRROR)/m4
M4_LICENSE = GPL-3.0+
M4_LICENSE_FILES = COPYING
M4_CPE_ID_VENDOR = gnu

$(eval $(host-autotools-package))
