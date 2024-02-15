# PATH settings
export PATH="/home/yasu/anaconda3/bin:$PATH"
[ -f "/home/yasu/.ghcup/env" ] && source "/home/yasu/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
# xdg
 export XDG_DATA_HOME="$HOME/.local/share"
 export XDG_STATE_HOME="$HOME/.local/state"
 export XDG_CACHE_HOME="$HOME/.cache"
 export XDG_CONFIG_HOME="$HOME/.config"
# xdg-ninja
 export ZDOTDIR="$HOME/.config/zsh"
 export HISTFILE="$XDG_STATE_HOME/zsh/history" 
 export CARGO_HOME="$XDG_DATA_HOME"/cargo
 export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
 export ANDROID_USER_HOME="$XDG_DATA_HOME/android"

 alias adb='HOME="$XDG_DATA_HOME"/android adb'
#
