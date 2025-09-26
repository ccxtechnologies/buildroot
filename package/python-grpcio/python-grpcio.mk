################################################################################
#
# python-grpcio
#
################################################################################

# This version depends on protobuf and python-grpcio-reflection
PYTHON_GRPCIO_SITE = $(TOPDIR)/../thirdparty/grpc
PYTHON_GRPCIO_SITE_METHOD = local
PYTHON_GRPCIO_SETUP_TYPE = setuptools
PYTHON_GRPCIO_LICENSE = Apache-2.0
PYTHON_GRPCIO_LICENSE_FILES = LICENSE
PYTHON_GRPCIO_ENV = GRPC_PYTHON_BUILD_WITH_CYTHON=1
PYTHON_GRPCIO_CPE_ID_VENDOR = grpc
PYTHON_GRPCIO_CPE_ID_PRODUCT = grpc
PYTHON_GRPCIO_CPE_ID_VERSION = 1.70.2

$(eval $(python-package))
