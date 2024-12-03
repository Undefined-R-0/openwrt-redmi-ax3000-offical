rm -rf package/helloworld
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

git -C package/helloworld pull

rm -rf package/helloworld/shadowsocks-rust
