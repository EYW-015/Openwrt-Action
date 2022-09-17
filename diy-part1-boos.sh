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

#config IP
#sed -i 's/10.10.10.1/192.168.60.1/g' package/base-files/files/bin/config_generate
#default pass
#sed -i '1c root:$1$iSotEnJU$wE9O2ciW4UTPHdwDynQJ80:0:0:99999:7:::' package/base-files/files/etc/shadow
