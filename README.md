# luci-app-connected

View list of connected devices on OpenWrt using **ip -4 neigh** (so IPv4 only!)

Augmented with hostnames from reverse DNS lookup.

<img src="screenshots/connected.png" alt="Connected Devices" style="border: 2px solid #333" width="80%">

## Important

Version 2 is stricly for OpenWrt 25. Previous versions are for OpenWrt 24 and are frozen.

## Install

##### On OpenWrt 25

Example - for v2.0.0-r1

```bash
wget -O luci-app-connected.apk https://github.com/marinierb/luci-app-connected/releases/download/v2.0.0/luci-app-connected-2.0.0-r1.apk
apk add --allow-untrusted luci-app-connected.apk
```

##### On OpenWrt 24

```bash
wget -O luci-app-connected.apk https://github.com/marinierb/luci-app-connected/releases/download/v1.0.6/luci-app-connected.ipk
opkg install luci-app-connected.ipk
```

## Login to LuCI

On OpenWrt 24, log out and back in for the new menu item to appear.

## Open the new page

In the LuCI Status menu, click on *Connected*

-    **Status -> Connected**

## That's it!

Enjoy!
