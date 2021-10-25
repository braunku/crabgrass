# -*-makefile-*-
# $Id$
#


#
# We provide this package
#
PACKAGES-$(PTXCONF_CRABGRASS) +=crabgrass

#
# Paths and names
#
CRABGRASS_VERSION	:= 0.01
CRABGRASS		:= crabgrass
CRABGRASS_URL		:= file://$(SRCDIR)/src/crabgrass
CRABGRASS_DIR		:= $(BUILDDIR)/$(CRABGRASS)
CRABGRASS_SOURCE	:= $(SRCDIR)/$(CRABGRASS)
CRABGRASS_LICENSE	:= MIT

CDUP = ..

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(STATEDIR)/crabgrass.get:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(STATEDIR)/crabgrass.extract:
	@$(call targetinfo, $@)
	@$(call clean, $(CRABGRASS_DIR))
	cp -rd $(CRABGRASS_SOURCE) $(CRABGRASS_DIR)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

CRABGRASS_PATH	:= PATH=$(CROSS_PATH)
CRABGRASS_ENV 	:= $(CROSS_ENV)

$(STATEDIR)/crabgrass.prepare:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/crabgrass.compile:
	@$(call targetinfo, $@)
	@cd $(CRABGRASS_DIR) && \
		$(CRABGRASS_ENV) $(CRABGRASS_PATH) DIST_DIR=$(PTXDIST_PLATFORMDIR) \
		env \
		DIST_DIR=$(PTXDIST_PLATFORMDIR) CROSS_COMPILE=$(COMPILER_PREFIX) \
		$(MAKE)			
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/crabgrass.install:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/crabgrass.targetinstall:
	@$(call targetinfo, $@)
	@$(call install_init, crabgrass)
	@$(call install_fixup,crabgrass,PRIORITY,optional)
	@$(call install_fixup,crabgrass,VERSION,$(CRABGRASS_VERSION))	
	@$(call install_fixup,crabgrass,SECTION,base)
	@$(call install_fixup,crabgrass,AUTHOR,"Kurt Braun")
	@$(call install_copy, crabgrass, 0, 0, 0755, $(CRABGRASS_DIR)/crabgrass, /usr/bin/crabgrass)
	@$(call install_copy, crabgrass, 0, 0, 0644, $(CRABGRASS_SOURCE)/config.cfg, /etc/config.cfg)

	@$(call install_lib, mosquitto, 0, 0, 0644, libmosquitto)
	#@$(call install_lib, libconfig, 0, 0, 0644, libconfig)
	#@$(call install_lib, 0, 0, 0644, ljson-c)		

	@$(call install_finish,crabgrass)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

crabgrass_clean:
	rm -rf $(STATEDIR)/crabgrass.*
	
# vim: syntax=make
