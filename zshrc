export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo  '±' && return
    echo '○'
}
#$fg[default]

autoload -U colors && colors
setopt prompt_subst

PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$reset_color%}in %{$fg_no_bold[green]%}%2~ %{$reset_color%}
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

if [ -f ~/.dotfiles/aliases ]; then
    . ~/.dotfiles/aliases
fi

