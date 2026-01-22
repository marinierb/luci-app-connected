module("luci.controller.connected", package.seeall)

function index()
    entry({"admin", "status", "connected"}, call("action_index"), _("Connected"), 2)
    entry({"admin", "status", "connected", "clear_arp"}, call("action_clear_arp"), nil).leaf = true
end

function action_index()
    local sys = require "luci.sys"
    local nixio = require "nixio"
    local util = require "luci.util"
    local tpl = require "luci.template"

    local function ip_compare(a, b)
        local a_parts = util.split(a, ".")
        local b_parts = util.split(b, ".")
        for i = 1, 4 do
            local a_num = tonumber(a_parts[i]) or 0
            local b_num = tonumber(b_parts[i]) or 0
            if a_num ~= b_num then
                return a_num < b_num
            end
        end
        return false
    end

    local device_clients = {}
    local output = sys.exec("ip -4 neigh show")
    for line in output:gmatch("[^\r\n]+") do
        if not line:match("FAILED") and not line:match("INCOMPLETE") then
            local ip = line:match("(%d+%.%d+%.%d+%.%d+)")
            local hostname = nixio.getnameinfo(ip)
            if hostname then hostname = hostname:gsub("%.home%.arpa$", "") end
            local mac = line:match("lladdr%s([%x:]+)")
            local state = line:match("%s(%u+)%s*$")
            local device = line:match("dev%s([%w%d%-_]+)")
            if ip and device then
                if not device_clients[device] then device_clients[device] = {} end
                table.insert(device_clients[device], {
                    ip = ip,
                    mac = mac or "",
                    hostname = hostname or "",
                    state = state or "",
                })
            end
        end
    end

    for _, clients in pairs(device_clients) do
        table.sort(clients, function(a, b)
            if type(a.ip) ~= "string" or type(b.ip) ~= "string" then
                return tostring(a.ip) < tostring(b.ip)
            end
            return ip_compare(a.ip, b.ip)
        end)
    end

    tpl.render("connected/index", {devices = device_clients})
end

function action_clear_arp()
    local sys = require "luci.sys"
    local http = require "luci.http"

    sys.call("ip -4 neigh flush all")
    http.redirect(luci.dispatcher.build_url("admin/status/connected"))
end
