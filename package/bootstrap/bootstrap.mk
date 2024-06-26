################################################################################
#
# bootstrap
#
################################################################################

BOOTSTRAP_VERSION = 5.3.1
BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
BOOTSTRAP_LICENSE = MIT
BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
BOOTSTRAP_CPE_ID_VENDOR = getbootstrap

define BOOTSTRAP_EXTRACT_CMDS
	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)
endef

define BOOTSTRAP_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
		$(TARGET_DIR)/srv/http/bootstrap/bootstrap.min.css
	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css.map \
		$(TARGET_DIR)/srv/http/bootstrap/bootstrap.min.css.map
	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.bundle.min.js \
		$(TARGET_DIR)/srv/http/bootstrap/bootstrap.bundle.min.js
endef

$(eval $(generic-package))
