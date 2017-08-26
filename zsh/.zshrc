export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM=xterm-256color

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo  '±' && return
    echo '○'
}

autoload -U colors && colors
setopt prompt_subst

prompt_user_color='green'

if [[ -n $SSH_CLIENT ]]; then
  prompt_host_color='magenta'
else
  prompt_host_color='blue'
fi

PROMPT="%{$fg[$prompt_user_color]%}%n%{$reset_color%}@%{$fg[$prompt_host_color]%}%m %{$reset_color%}in %{$fg_no_bold[yellow]%}%2~ %{$reset_color%}
$(prompt_char) "

if [ -f ~/.zsh/git_prompt.zsh ]; then
    . ~/.zsh/git_prompt.zsh  
    RPROMPT='$(git_prompt_string)'
fi

if [ -f ~/.zsh/venv.zsh ]; then
    . ~/.zsh/venv.zsh
    PROMPT="$(virtualenv_info)%{$reset_color%}${PROMPT}"
fi

### Fix keybindings
bindkey "${terminfo[home]}" beginning-of-line
bindkey "^[[3~"             delete-char

### Auto-completion
autoload -Uz compinit
compinit

## Syntax highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

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
