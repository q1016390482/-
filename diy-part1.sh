#!/bin/bash

# 删除旧 PassWall feed
sed -i '/passwall/d' feeds.conf.default

# 删除旧 OpenClash feed
sed -i '/openclash/d'


# 删除已经存在的旧包目录
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash


# 添加 PassWall 官方仓库

echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default

echo 'src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' >> feeds.conf.default


# 添加 OpenClash 官方仓库

echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >> feeds.conf.default

# 添加 Clashoo

echo 'src-git clashoo https://github.com/kenzok8/openwrt-clashoo.git' >> feeds.conf.default


# 添加晶晨宝盒

git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
