module("luci.controller.connected", package.seeall)

function index()
    entry({"admin", "status", "connected"}, template("connected/index"), _("Connected"), 2)
end
