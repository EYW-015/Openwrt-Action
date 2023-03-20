#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.60.1/g' package/base-files/files/bin/config_generate
# Clear default password
sed -i '1c root::0:0:99999:7:::' package/base-files/files/etc/shadow
# Change Hostname
#sed -i 's/OpenWrt/OP-EYW/g' package/base-files/files/bin/config_generate

# Config WiFi SSID & PASS
#sed -i 's/OpenWrt/Redmi-AX6/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# WPA3/WPA2
#sed -i 's/none/sae-mixed\n\t\t\tset wireless.default_radio\$\{devidx\}.key\=12345678/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
# WPA2
#sed -i 's/none/psk2\n\t\t\tset wireless.default_radio\$\{devidx\}.key\=12345678/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Set Gateway & DNS
#sed -i "/set network.\$1.netmask='\$netm'/a \\\t\t\t\tset network.\$1.gateway='192.168.50.1'\n\t\t\t\tset network.\$1.dns='192.168.50.1'" package/base-files/files/bin/config_generate

# Config WAN to PPPoE
#sed -i 's/-dhcp/-pppoe/g' package/base-files/files/lib/functions/uci-defaults.sh
# Config default PPPoE account
#sed -i "s/'username'/'<youraccount>'/g" package/base-files/files/bin/config_generate
#sed -i "s/'password'/'<yourpass>'/g" package/base-files/files/bin/config_generate

# Custom theme
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon-mod
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# Helloworld
git clone https://github.com/fw876/helloworld package/helloworld

# OpenClash bypass
svn checkout https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
sed -i 's/ipset add localnetwork 192.168.0.0\/16/ipset add localnetwork 192.168.60.0\/24/g' package/luci-app-openclash/root/etc/init.d/openclash
sed -i 's/192.168.0.0\/16/192.168.60.0\/24/g' package/luci-app-openclash/root/etc/openclash/custom/openclash_custom_localnetwork_ipv4.list

# Adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# Smartdns
#git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
#git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# Other package
#git clone https://github.com/zzsj0928/luci-app-pushbot.git package/luci-app-pushbot
#git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper

# Version of qBittorren
#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.4.5_v2.0.8' feeds/packages/net/qBittorrent-static/Makefile
#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.4.5' feeds/packages/net/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=70c2128b44fe4df4dfc8afc765a304d70cf1b042b5214bcc855d8b3bbc9ccf36' feeds/packages/net/qBittorrent/Makefile
