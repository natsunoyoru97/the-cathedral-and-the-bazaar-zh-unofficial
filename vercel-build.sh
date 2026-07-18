#!/bin/bash
set -e # 任何一步失败则整体失败

# 1. 安装 mdBook
echo "Installing mdbook"
curl -sSLf https://github.com/rust-lang/mdBook/releases/download/v0.4.52/mdbook-v0.4.52-x86_64-unknown-linux-gnu.tar.gz | tar -xz -C /tmp
mv /tmp/mdbook /usr/local/bin/
mdbook --version || exit 1

# 2. 安装 mdbook-admonish
# NOTE: 由于新版存在构建 bug，故选用 v1.20.0
echo "Installing mdbook-admonish"
ADMONISH_URL="https://github.com/tommilligan/mdbook-admonish/releases/download/v1.20.0/mdbook-admonish-v1.20.0-x86_64-unknown-linux-gnu.tar.gz"
curl -sSLf "$ADMONISH_URL" | tar -xz -C /tmp
mv /tmp/mdbook-admonish /usr/local/bin/
which mdbook-admonish || exit 1

# 3. 执行构建
echo "Preparing mdbook build"
mdbook build