function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '%{$fg[green]%}(%{$fg[yellow]%}'`basename $VIRTUAL_ENV`'%{$fg[green]%}) '
}
