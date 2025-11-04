################################################################################
#
# libnftnl
#
################################################################################

LIBNFTNL_VERSION = 1.2.7
LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.xz
LIBNFTNL_LICENSE = GPL-2.0+
LIBNFTNL_LICENSE_FILES = COPYING
LIBNFTNL_CPE_ID_VENDOR = netfilter
LIBNFTNL_CPE_ID_PRODUCT = libnftnl
LIBNFTNL_INSTALL_STAGING = YES
LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl

$(eval $(autotools-package))
