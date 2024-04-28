# PATH settings
#export PATH="/home/yasu/anaconda3/bin:$PATH"

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
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
[ -f "$XDG_DATA_HOME/ghcup/env" ] && source "$XDG_DATA_HOME/ghcup/env" # ghcup-env
. "$CARGO_HOME/env"
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup 
export SQLITE_HISTORY="$XDG_CACHE_HOME"/sqlite_history 
export STACK_ROOT="$XDG_DATA_HOME"/stack 
export STACK_XDG=1 
export NVM_DIR="$XDG_DATA_HOME"/nvm
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv 
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet 
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython" 
export PYTHONSTARTUP="$HOME"/python/pythonrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint 
export CABAL_CONFIG="$XDG_CONFIG_HOME"/cabal/config
export CABAL_DIR="$XDG_DATA_HOME"/cabal 
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc 

export GHCUP_USE_XDG_DIRS=true 
export GNUPGHOME="$XDG_DATA_HOME"/gnupg 

export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
alias adb='HOME="$XDG_DATA_HOME"/android adb'

export WINEPREFIX="$XDG_DATA_HOME"/wine
