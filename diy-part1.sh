#!/bin/bash

# 删除原有 passwall 相关 feed
sed -i '/passwall/d' feeds.conf.default

# 添加 PassWall 官方仓库
echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' >> feeds.conf.default


# 添加 OpenClash
echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default


# 添加 Clashoo
echo 'src-git clashoo https://github.com/kenzok8/openwrt-clashoo.git' >> feeds.conf.default
# 晶晨宝盒
svn co 
https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
