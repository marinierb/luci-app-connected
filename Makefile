include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-connected
PKG_VERSION:=2.0.0
PKG_RELEASE:=1
PKG_LICENSE:=MIT
PKG_MAINTAINER:=
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_USE_MIPS16:=0

LUCI_PACKAGE:=luci-app-connected
LUCI_TITLE:=Connected Devices Viewer
LUCI_DEPENDS:=+luci-base +rpcd +ucode +ucode-mod-resolv
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/rpcd/ucode
	$(INSTALL_DATA) ./root/usr/share/rpcd/ucode/luci.connected \
		$(1)/usr/share/rpcd/ucode/luci.connected

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-connected.json \
		$(1)/usr/share/rpcd/acl.d/luci-app-connected.json

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-connected.json \
		$(1)/usr/share/luci/menu.d/luci-app-connected.json

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/connected
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/connected/index.js \
		$(1)/www/luci-static/resources/view/connected/index.js
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -x /etc/init.d/rpcd ] && /etc/init.d/rpcd restart || true
endef

# call BuildPackage - OpenWrt buildroot signature
$(eval $(call BuildPackage,$(PKG_NAME)))
