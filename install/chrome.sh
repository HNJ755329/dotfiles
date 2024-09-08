if ! type google-chrome >/dev/null 2>&1;then
curl -L -o $HOME/Downloads/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install $HOME/Downloads/google-chrome-stable_current_amd64.deb
fi
