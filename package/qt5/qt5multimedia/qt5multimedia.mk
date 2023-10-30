################################################################################
#
# qt5multimedia
#
################################################################################

QT5MULTIMEDIA_VERSION = 76f84c545429a1b988b79f971734ef4bc3e6643f
QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
QT5MULTIMEDIA_INSTALL_STAGING = YES
QT5MULTIMEDIA_SYNC_QT_HEADERS = YES

QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5MULTIMEDIA_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
endif

ifeq ($(BR2_PACKAGE_LIBGLIB2)$(BR2_PACKAGE_PULSEAUDIO),yy)
QT5MULTIMEDIA_DEPENDENCIES += libglib2 pulseaudio
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
endif

ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
QT5MULTIMEDIA_LICENSE += , LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
QT5MULTIMEDIA_LICENSE_FILES += examples/multimedia/spectrum/3rdparty/fftreal/license.txt
endif

$(eval $(qmake-package))
