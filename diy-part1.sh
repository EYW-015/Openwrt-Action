#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#添加openclash===========
#sed -i '$a src-git openclash https://github.com/vernesong/OpenClash' feeds.conf.default
git rm target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
git add target/linux/ipq807x/patches-5.10/900-arm64-dts-add-OpenWrt-DTS-files.patch
git revert -n edbd8d2e9839357f3a4f0a06174d243f362b1544
