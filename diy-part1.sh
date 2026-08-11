#!/bin/bash

# 删除 LEDE 自带相关 feed，避免重复
sed -i '/passwall/d' feeds.conf.default
sed -i '/openclash/d'


# 添加 PassWall 官方仓库

echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >> feeds.conf.default

echo 'src-git passwall_luci https://github.com/Openwrt-Passwall/openwrt-passwall.git;main' >> feeds.conf.default


# 添加 OpenClash 官方仓库

echo 'src-git openclash https://github.com/vernesong/OpenClash.git;master' >> feeds.conf.default


# 添加 Clashoo

echo 'src-git clashoo https://github.com/kenzok8/openwrt-clashoo.git' >> feeds.conf.default


# 添加晶晨宝盒

git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
