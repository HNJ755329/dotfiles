#!/usr/bin/env sh

sudo apt-get update update && apt-get install -y \
curl \
git \
gh \
tig \
zsh \
alacritty \
ripgrep \
htop \
eza \
fzf \
navi \
xclip \
zoxide \
picom \
i3 \
rofi \
fcix5-mozc \
emacs \
emacs-mozc \
emacs-mozc-bin \
go \
python3 \
ghcup \
bash-language-server \
ctags \
google-chrome-stable \
apvlv \
openssh-client \
openssh-server \
gcc \
gdb \
&& apt-get clean \
# && rm -rf /var/lib/apt/lists/*

./install/node.sh
./install/python.sh
./install/rust.sh
./install/docker.sh
./install/nvim.sh
