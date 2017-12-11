################################################################################
#
# midas-util
#
################################################################################

MIDAS_UTIL_VERSION = 2eca13712acffa380989ee36a668845b7d8c2e3f
MIDAS_UTIL_SITE = $(call github,fourkbomb,midas-util,$(MIDAS_UTIL_VERSION))
MIDAS_UTIL_LICENSE = GPL-3.0+
MIDAS_UTIL_LICENSE_FILES = .gitignore
MIDAS_UTIL_DEPENDENCIES = dtc

# Makefile in the repo uses host 'gcc' directly.
# This below uses a make implicit rule so that it picks variables like CC.
define MIDAS_UTIL_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install CFLAGS='--sysroot $(STAGING_DIR)'
endef

define MIDAS_UTIL_INSTALL_TARGET_CMDS
	cp -v $(@D)/out/bin/* $(TARGET_DIR)/bin
	cp -v $(@D)/out/lib/* $(TARGET_DIR)/lib
endef

$(eval $(generic-package))
