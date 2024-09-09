#!/usr/bin/env bash

if ! echo $PATH | grep -q 'local/share/cargo/bin';then
  export PATH="$PATH:$HOME/.local/share/cargo/bin"
fi

export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup" 

if ! type cargo > /dev/null 2>&1;then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
sudo apt-get install -y \
cmake \
pkg-config \
libfreetype6-dev \
libfontconfig1-dev \
libxcb-xfixes0-dev \
python3

rustup default stable;

# if ! type alacritty > /dev/null 2>&1;then
# cargo install alacritty
# fi
# depends cargo-atcoder
sudo apt-get install -y libssl-dev;
cargo install cargo-atcoder alacritty eza navi zoxide
