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
sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i '112a set network.$1.gateway='192.168.50.1'' package/base-files/files/bin/config_generate
sed -i '112a set network.$1.dns='223.5.5.5'' package/base-files/files/bin/config_generate
sed -i '113s/^/\t\t\t\t/g' package/base-files/files/bin/config_generate
sed -i '114s/^/\t\t\t\t/g' package/base-files/files/bin/config_generate
#降低qBit版本===========
sed -i 's/4.3.1/4.3.0.1/g' /package/lean/qBittorrent/Makefile
#替换添加老竭力Argon主题===========
pushd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon
popd
#添加openclash===========
mkdir package/luci-app-openclash
pushd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull origin master
git branch --set-upstream-to=origin/master master
popd
