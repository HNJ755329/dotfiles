#!/usr/bin/env bash

if ! echo $PATH | grep -q 'go'; then
export PATH="$PATH:/usr/local/go/bin"
fi

if ! type go >/dev/null 2>&1; then
curl -LO https://go.dev/dl/go1.23.1.linux-amd64.tar.gz;
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.1.linux-amd64.tar.gz;
fi
