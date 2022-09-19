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
#sed -i '1c root::0:0:99999:7:::' package/base-files/files/etc/shadow

# Change Hostname
#sed -i 's/OpenWrt/OP-EYW/g' package/base-files/files/bin/config_generate

# Set Gateway & DNS
#sed -i "/set network.\$1.netmask='\$netm'/a \\\t\t\t\tset network.\$1.gateway='192.168.50.1'\n\t\t\t\tset network.\$1.dns='192.168.50.1'" package/base-files/files/bin/config_generate

# Custom theme
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-argon-mod
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config

# Config OpenClash
sed -i 's/ipset add localnetwork 192.168.0.0\/16/ipset add localnetwork 192.168.60.0\/24/g' feeds/openclash/luci-app-openclash/root/etc/init.d/openclash
sed -i 's/192.168.0.0\/16/192.168.60.0\/24/g' feeds/openclash/luci-app-openclash/root/etc/openclash/custom/openclash_custom_localnetwork_ipv4.list
