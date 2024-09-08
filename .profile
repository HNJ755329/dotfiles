# PATH settings
#export PATH="/home/yasu/anaconda3/bin:$PATH"

[ -f $HOME/venv/base/bin/activate ] && source $HOME/venv/base/bin/activate
# export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
# xdg
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
# xdg-ninja
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history" 
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$HOME/node-v20.16.0-linux-x64/bin:$PATH"
[ -f "$XDG_DATA_HOME/ghcup/env" ] && source "$XDG_DATA_HOME/ghcup/env" # ghcup-env
# . "$CARGO_HOME/env"
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

#export NVM_DIR="$HOME/.local/share/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# from manjaro init settings
#!/bin/sh
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=nvim

# Most pure GTK3 apps use wayland by default, but some,
# such as Firefox, require the backend to be explicitly selected.
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

# qt wayland
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

#Java XWayland blank screens fix
export _JAVA_AWT_WM_NONREPARENTING=1

# set default shell and terminal
export SHELL=/usr/bin/zsh
export TERMINAL_COMMAND=xdg-terminal-exec

# add default location for zeit.db
export ZEIT_DB="$HOME/.config/zeit.db"

# set ozone platform to wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# Disable hardware cursors. This might fix issues with
# disappearing cursors
if systemd-detect-virt -q; then
    # if the system is running inside a virtual machine, disable hardware cursors
    export WLR_NO_HARDWARE_CURSORS=1
fi

# Disable warnings by OpenCV
export OPENCV_LOG_LEVEL=ERROR

set -a
. "$HOME/.config/user-dirs.dirs"
set +a

if [ -n "$(ls "$HOME"/.config/profile.d 2>/dev/null)" ]; then
    for f in "$HOME"/.config/profile.d/*; do
        # shellcheck source=/dev/null
        . "$f"
    done
fi

# Enable Fcitx5
# See https://wiki.archlinux.org/title/Localization/Japanese
export DefaultImModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
