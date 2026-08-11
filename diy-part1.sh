#!/bin/bash
# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# 删除旧 PassWall feed
sed -i '/passwall/d' feeds.conf.default

# 删除旧 OpenClash feed
sed -i '/openclash/d'


# 删除已经存在的旧包目录
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/mosdns

# 添加 PassWall 官方仓库

git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/openwrt-passwall-packages
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall package/openwrt-passwall


# 添加 OpenClash 官方仓库

git clone --depth=1 https://github.com/vernesong/OpenClash package/luci-app-openclash



# 添加晶晨宝盒

git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
git clone -b v5-lua --single-branch --depth 1 https://github.com/sbwml/luci-app-mosdns package/mosdns
