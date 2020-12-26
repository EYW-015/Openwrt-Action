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
#选择qBit版本===========
#sed -i '4c PKG_VERSION:=4.3.1' package/lean/qBittorrent/Makefile
#sed -i '9c PKG_HASH:=4428ed710cfbcc48e75c4cdb014b803ea3f67311f55f4cba0d148987986bd6c8' package/lean/qBittorrent/Makefile
#sed -i '4c PKG_VERSION:=4.3.0.1' package/lean/qBittorrent/Makefile
#sed -i '9c PKG_HASH:=af17daa57d750522357393aca32a4dd57f5b0f271f2c49b3ce6908baee5ed93b' package/lean/qBittorrent/Makefile
sed -i '4c PKG_VERSION:=4.2.5' package/lean/qBittorrent/Makefile
sed -i '9c PKG_HASH:=1dac52d6fe4b0c44dba04fcfc41f519c57a69cb30580255edca95c87053a4324' package/lean/qBittorrent/Makefile
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
