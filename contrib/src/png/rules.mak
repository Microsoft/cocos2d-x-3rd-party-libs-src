# PNG
PNG_VERSION := 1.6.12
PNG_URL := $(SF)/libpng/libpng16/$(PNG_VERSION)/libpng-$(PNG_VERSION).tar.xz

PKGS += png
ifeq ($(call need_pkg,"libpng"),)
PKGS_FOUND += png
endif

$(TARBALLS)/libpng-$(PNG_VERSION).tar.xz:
	$(call download,$(PNG_URL))

.sum-png: libpng-$(PNG_VERSION).tar.xz

png: libpng-$(PNG_VERSION).tar.xz .sum-png
	$(UNPACK)
	$(MOVE)



DEPS_png = zlib $(DEPS_zlib)

.png: png
	$(RECONF)
	cd $< && $(HOSTVARS) ./configure  --enable-arm-neon=api $(HOSTCONF)
	cd $< && $(MAKE) install
	touch $@