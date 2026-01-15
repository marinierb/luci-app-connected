# makefile for luci-app-connected

include $(TOPDIR)/rules.mk
PKG_NAME:=luci-app-connected
PKG_VERSION:=1.0.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=Connected Devices Viewer
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  A LuCI application to view connected devices on OpenWrt.
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) usr/lib/lua/luci/controller/connected.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/connected
	$(INSTALL_DATA) usr/lib/lua/luci/view/connected/index.htm $(1)/usr/lib/lua/luci/view/connected/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
