# PATH settings
export PATH="/home/yasu/anaconda3/bin:$PATH"
[ -f "/home/yasu/.ghcup/env" ] && source "/home/yasu/.ghcup/env" # ghcup-env
. "$HOME/.cargo/env"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
# xdg-ninja
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history" 
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
