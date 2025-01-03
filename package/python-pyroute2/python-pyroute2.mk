################################################################################
#
# python-pyroute2
#
################################################################################

PYTHON_PYROUTE2_SITE = $(TOPDIR)/../thirdparty/pyroute2
PYTHON_PYROUTE2_SITE_METHOD = local

PYTHON_PYROUTE2_LICENSE = Apache-2.0
PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0
PYTHON_PYROUTE2_SETUP_TYPE = setuptools
PYTHON_PYROUTE2_CPE_ID_VERSION = 0.7.12

$(eval $(python-package))
