################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
PYTHON_PROTOBUF_SOURCE = protobuf-python-4.$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools
PYTHON_PROTOBUF_SUBDIR = python
PYTHON_PROTOBUF_CPE_ID_VENDOR = google
PYTHON_PROTOBUF_CPE_ID_PRODUCT = protobuf-python

$(eval $(python-package))
