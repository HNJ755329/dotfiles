#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y \
curl \
gh \
tig \
zsh \
ripgrep \
htop \
fzf \
xclip \
fcitx5-mozc \
emacs \
emacs-mozc \
emacs-mozc-bin \
python3 \
apvlv \
openssh-client \
openssh-server \
gcc \
gdb \
universal-ctags \
cargo \
rustup \
eza \
alacritty \
zoxide \
sway \
rofi \
# i3 \
# picom \
# feh \
# && apt-get clean \
# && rm -rf /var/lib/apt/lists/*

./install/python_pip.sh
./install/rust_cargo.sh
./install/docker.sh
./install/nvim.sh
./install/node.sh
./install/golang.sh
./install/haskell.sh
./install/chrome.sh
./install/zsh.sh
