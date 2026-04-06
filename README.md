# luci-app-connected

[!IMPORTANT]
For OpenWrt 25.12 only!

View list of connected devices on OpenWrt using **ip -4 neigh** (so IPv4 only!)

Augmented with hostnames from reverse DNS lookup.

<img src="screenshots/connected.png" alt="Connected Devices" style="border: 2px solid #333" width="80%">

## Install

```bash
wget https://marinierb.github.io/luci-app-connected/luci-app-connected.apk
apk add --allow-untrusted luci-app-connected.apk
```

## Install Languages

See https://marinierb.github.io/luci-app-connected/

Install as above.

## Open the new page

In LuCI
- Log out and back in
- Open **Status → Connected**

## That's it!

Enjoy!
