# !/bin/bash

LATEST_RELEASE=$(curl -s "https://api.github.com/repos/derailed/k9s/releases/latest")
LATEST_VERSION=$(echo "$LATEST_RELEASE" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Latest Version: $LATEST_VERSION"

K9S_VERSION=${K9S_VERSION:-$LATEST_VERSION}

echo "Installing Version: $K9S_VERSION ..."

curl -LO https://github.com/derailed/k9s/releases/download/$K9S_VERSION/k9s_Linux_amd64.tar.gz
tar -xzf k9s_Linux_amd64.tar.gz
sudo mv k9s /usr/local/bin

echo "Cleaning up ..."

rm -rf LICENSE README.md k9s_Linux_amd64.tar.gz

echo "K9S Installed Successfully!"

k9s version
