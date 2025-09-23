################################################################################
#
# python-grpcio-reflection
#
################################################################################

PYTHON_GRPCIO_REFLECTION_VERSION = 1.75.0
PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/e1/34/8c6c667a3d646f3f58041f69e774f5f98eabaeb973321498681cbe2a9441
PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE

$(eval $(python-package))
