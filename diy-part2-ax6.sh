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
#sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Change Hostname
sed -i 's/OpenWrt/AX6/g' package/base-files/files/bin/config_generate

# Version of qBittorrent
#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.1.9' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=620127f73f88ed3f2b2e4195cbc641f7c27f967d3b045e45f7916c0995fd61fe' package/lean/qBittorrent/Makefile

#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.2.5' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=1dac52d6fe4b0c44dba04fcfc41f519c57a69cb30580255edca95c87053a4324' package/lean/qBittorrent/Makefile

#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.3.4.1' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=8f615aa06f77286881d40b5f769f648221128b46f0bffc1f2fa101068f99ebe8' package/lean/qBittorrent/Makefile

sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.3.5' package/lean/qBittorrent/Makefile
sed -i '/PKG_HASH:=/c PKG_HASH:=83b6165f9f969406a2daabc7f49bbdc79aa6840c1e707cbade97eeb15a4907f3' package/lean/qBittorrent/Makefile

#sed -i '/PKG_VERSION:=/c PKG_VERSION:=4.3.6' package/lean/qBittorrent/Makefile
#sed -i '/PKG_HASH:=/c PKG_HASH:=dc673e20e69077dcebd836dade38e15c19289a8cda5837bf1f19206f16bf4751' package/lean/qBittorrent/Makefile

# Theme of Argon
pushd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
popd
