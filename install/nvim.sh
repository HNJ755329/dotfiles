#!/usr/bin/env sh

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
sudo ln -s /opt/nvim/nvim /usr/bin/nvim
