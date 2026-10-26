################################################################################
#
# python-brotli
#
################################################################################

PYTHON_BROTLI_VERSION = 1.1.1
PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
PYTHON_BROTLI_SITE = $(call github,google,brotli,v$(PYTHON_BROTLI_VERSION))
PYTHON_BROTLI_SETUP_TYPE = setuptools
PYTHON_BROTLI_LICENSE = MIT
PYTHON_BROTLI_LICENSE_FILES = LICENSE
PYTHON_BROTLI_CPE_ID_VENDOR = google
PYTHON_BROTLI_CPE_ID_PRODUCT = brotli

PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
PYTHON_BROTLI_CFLAGS += -O0
endif

PYTHON_BROTLI_ENV = CFLAGS="$(PYTHON_BROTLI_CFLAGS)"

$(eval $(python-package))
