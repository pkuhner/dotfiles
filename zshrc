autoload -Uz promptinit
promptinit
prompt redhat

if [ -f ~/.dotfiles/zsh/git_prompt.zsh ]; then
    . ~/.dotfiles/zsh/git_prompt.zsh  
    RPROMPT='$(git_prompt_string)'
fi

### Auto-completion

autoload -Uz compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Completing process IDs with menu selection
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

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

# Persistant history
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space


setopt nobeep

if [ -f ~/.dotfiles/aliases ]; then
    . ~/.dotfiles/aliases
fi
