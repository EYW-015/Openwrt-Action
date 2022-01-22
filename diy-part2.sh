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
# Change Hostname
#sed -i 's/OpenWrt/OP-EYW/g' package/base-files/files/bin/config_generate

# Set Gateway & DNS
#sed -i "/set network.\$1.netmask='\$netm'/a \\\t\t\t\tset network.\$1.gateway='192.168.50.1'\n\t\t\t\tset network.\$1.dns='192.168.50.1'" package/base-files/files/bin/config_generate

# Version of qBittorren
#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.1.9' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=620127f73f88ed3f2b2e4195cbc641f7c27f967d3b045e45f7916c0995fd61fe' package/lean/qBittorrent/Makefile

#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.2.5' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=1dac52d6fe4b0c44dba04fcfc41f519c57a69cb30580255edca95c87053a4324' package/lean/qBittorrent/Makefile

sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.3.9_v1.2.14' package/lean/qBittorrent-static/Makefile
sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.3.9' package/lean/qBittorrent/Makefile
sed -i '/PKG_HASH:=/c PKG_HASH:=6ff801cfe2beeb9fca24d4565e863e06f46bb8fc56c0eb833293ff31b3bfe83a' package/lean/qBittorrent/Makefile

#Custom package
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-argon-config
#rm -rf package/lean/luci-app-unblockmusic
#git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic

#Config OpenClash
sed -i 's/ipset add localnetwork 192.168.0.0\/16/ipset add localnetwork 192.168.60.0\/24/g' feeds/openclash/luci-app-openclash/root/etc/init.d/openclash
