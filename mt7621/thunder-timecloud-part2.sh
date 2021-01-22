# 管理地址
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 固件架构
cat >> .config <<EOF
CONFIG_TARGET_ramips=y
CONFIG_TARGET_ramips_mt7621=y
CONFIG_TARGET_ramips_mt7621_DEVICE_thunder_timecloud=y
EOF

# 禁用 IPV6
cat >> .config <<EOF
# CONFIG_IPV6 is not set
EOF

# 取消默认启用的包
cat >> .config <<EOF
# CONFIG_PACKAGE_luci-app-ddns is not set
# CONFIG_PACKAGE_luci-app-adbyby-plus is not set
# CONFIG_PACKAGE_luci-app-filetransfer is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set
# CONFIG_PACKAGE_luci-app-unblockmusic is not set
# CONFIG_PACKAGE_luci-app-arpbind is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-wol is not set
# CONFIG_PACKAGE_luci-app-ramfree is not set
# CONFIG_PACKAGE_luci-app-turboacc is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-app-cpufreq is not set
# CONFIG_PACKAGE_luci-app-ipsec-vpnd is not set
# CONFIG_PACKAGE_luci-app-zerotier is not set
# CONFIG_PACKAGE_v2ray is not set
# CONFIG_PACKAGE_shadowsocks-libev-ss-redir is not set
# CONFIG_PACKAGE_shadowsocksr-libev-server is not set
# CONFIG_PACKAGE_ddns-scripts_aliyun is not set
# CONFIG_PACKAGE_ddns-scripts_dnspod is not set
EOF

# 其它默认的包 luci luci-app-upnp luci-app-nlbwmon luci-app-samba autosamba automount default-settings

# 基本软件:
cat >> .config <<EOF
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_autocore-arm=y
EOF

cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-openclash=y

CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Simple_obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_DNS2SOCKS=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-i18n-ssr-plus-zh-cn=y

CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y
EOF

# 常用软件 默认已启用
#cat >> .config <<EOF
#CONFIG_PACKAGE_luci=y
#CONFIG_PACKAGE_luci-app-upnp=y
#CONFIG_PACKAGE_luci-app-nlbwmon=y
#CONFIG_PACKAGE_luci-app-samba=y
#CONFIG_PACKAGE_autosamba=y
#CONFIG_PACKAGE_default-settings=y
#EOF

# 其它
sed -i '21d' package/lean/default-settings/files/zzz-default-settings #禁止网络共享分类到NAS