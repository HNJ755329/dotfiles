#!/usr/bin/env bash

# install zsh
if ! type zsh > /dev/null 2>&1; then
  sudo apt-get update && apt-get install -y zsh
  chsh -s $(which zsh)
fi


#install oh my zsh
if [ ! -e $ZSH/oh-my-zsh.sh ];then
  ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
#install powerlevel10k
if [ ! -e ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/README.md ];then
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if !(fc-list | grep -q 'Meslo' > /dev/null 2>&1);then
  sudo curl -L "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20{Regular,Bold,Italic}.ttf" -o "/usr/local/share/fonts/MesloLGS NF #1.ttf"
  sudo curl -L "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf" -o "/usr/local/share/fonts/MesloLGS NF Bold Italic.ttf"
  # sudo curl --capath /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  # sudo curl --capath /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  # sudo curl --capath /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  # sudo curl --capath /usr/local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
  fc-cache -fv
fi
