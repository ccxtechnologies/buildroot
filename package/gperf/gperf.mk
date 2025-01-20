################################################################################
#
# gperf
#
################################################################################

GPERF_VERSION = 3.1
GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
GPERF_LICENSE = GPL-3.0+
GPERF_LICENSE_FILES = COPYING
GPERF_CPE_ID_VENDOR = gnu

$(eval $(autotools-package))
$(eval $(host-autotools-package))
