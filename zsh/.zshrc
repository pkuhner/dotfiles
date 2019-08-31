export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM=xterm-256color

source ~/.zsh_plugins.sh

### Fix keybindings
bindkey "${terminfo[home]}" beginning-of-line
bindkey "^[[3~"             delete-char

### Auto-completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Completing process IDs with menu selection
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

## Syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

### History
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Only show past commands matching the current line up to the current cursor position. 
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Persistant history
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

setopt nobeep

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export PATH=$PATH:$HOME/.local/bin
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH:$GOPATH/bin

eval `dircolors ~/.dir_colors`
