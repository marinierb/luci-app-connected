# makefile for luci-app-connected

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-connected

LUCI_TITLE:=Connected Devices Viewer
LUCI_PKGARCH:=all
PKG_VERSION:=1.0.2
PKG_RELEASE:=3

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
