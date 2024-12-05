cat <<EOF | sed -E 's/^  //' >> .config
  CONFIG_TARGET_ipq50xx=y
  CONFIG_TARGET_ipq50xx_arm=y
  CONFIG_TARGET_MULTI_PROFILE=y
  CONFIG_TARGET_ALL_PROFILES=y
  CONFIG_TARGET_PER_DEVICE_ROOTFS=y

  CONFIG_IB=y
  # CONFIG_IB_STANDALONE is not set
  CONFIG_SDK=y
  CONFIG_MAKE_TOOLCHAIN=y

  CONFIG_ALL_NONSHARED=y
  CONFIG_REPRODUCIBLE_DEBUG_INFO=y

  CONFIG_PACKAGE_luci=y
EOF
make defconfig

# replace dnsmasq to dnsmasq-full
# .config file path
CONFIG_FILE=".config"

# check .config is exist
if [[ ! -f $CONFIG_FILE ]]; then
    echo "Error: $CONFIG_FILE not found!"
    exit 1
fi


sed -i 's/^CONFIG_DEFAULT_dnsmasq=y/# &/' $CONFIG_FILE
sed -i 's/^CONFIG_MODULE_DEFAULT_dnsmasq=y/# &/' $CONFIG_FILE
sed -i 's/^CONFIG_PACKAGE_dnsmasq=m/# CONFIG_PACKAGE_dnsmasq is not set/' $CONFIG_FILE
sed -i 's/^CONFIG_PACKAGE_dnsmasq=y/# CONFIG_PACKAGE_dnsmasq is not set/' $CONFIG_FILE

echo "Replace dnsmasq to dnsmasq-full done."
