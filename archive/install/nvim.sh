#!/usr/bin/env bash
if ! type nvim >/dev/null 2>&1;then
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod u+x nvim.appimage
# mkdir -p /opt/nvim
# mv nvim.appimage /opt/nvim/nvim
# sudo ln -s /opt/nvim/nvim /usr/bin/nvim
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo rm /usr/bin/nvim
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi
