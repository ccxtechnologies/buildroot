################################################################################
#
# patchelf
#
################################################################################

PATCHELF_VERSION = 0.13
PATCHELF_SITE = \
	https://github.com/NixOS/patchelf/releases/download/$(PATCHELF_VERSION)
PATCHELF_SOURCE = patchelf-$(PATCHELF_VERSION).tar.bz2
PATCHELF_LICENSE = GPL-3.0+
PATCHELF_LICENSE_FILES = COPYING
PATCHELF_CPE_ID_VENDOR = nixos
PATCHELF_CPE_ID_PRODUCT = patchelf

$(eval $(host-autotools-package))
