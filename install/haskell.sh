#!/usr/bin/env bash
#required packages for ubuntu23<=
if ! type ghc >/dev/null 2>&1;then
sudo apt-get install -y \
build-essential \
curl \
libffi-dev \
libffi8ubuntu1 \
libgmp-dev \
libgmp10 \
libncurses-dev

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
fi
