#!/bin/bash

# Installation dir
if [[ ! -z $1 ]]; then
	if [[ -d $1 ]]; then
		DIR=$1
	else
		echo "$1 is not a directory!"
		exit 1
	fi
else
	DIR=$(dirname $(readlink -f $0))
	if [[ $DIR = $HOME* ]]; then DIR=~${DIR#$HOME}; fi
fi

echo "Sourcing dotfiles from $DIR"

# Do the install
[[ -e ~/.bashrc ]] || touch ~/.bashrc
if ! grep -q 'Source dotfiles' ~/.bashrc; then
	echo -e "#Source dotfiles\nsource $DIR/bashrc\n" | cat - ~/.bashrc >_tmp && mv _tmp ~/.bashrc
	echo "Installed in .bashrc"
fi

[[ -e ~/.bash_profile ]] || touch ~/.bash_profile
if ! grep -q 'Source dotfiles' ~/.bash_profile; then
	echo -e "# Source dotfiles\nsource $DIR/bash_profile\n" | cat - ~/.bash_profile >_tmp && mv _tmp ~/.bash_profile
	echo "Installed in .bash_profile"
fi

[[ -e ~/.vimrc ]] || touch ~/.vimrc
if ! grep -q 'Source dotfiles' ~/.vimrc; then
	echo -e "\" Source dotfiles\nsource $DIR/vimrc\n" | cat - ~/.vimrc >_tmp && mv _tmp ~/.vimrc
	echo "Installed in .vimrc"
fi

[[ -e ~/.gitconfig ]] || touch ~/.gitconfig
if ! grep -q 'Source dotfiles' ~/.gitconfig; then
	echo -e "# Source dotfiles\n[include]\npath=$DIR/gitconfig\n" | cat - ~/.gitconfig >_tmp && mv _tmp ~/.gitconfig
	echo "Installed in .gitconfig"
fi


[[ -e ~/.inputrc ]] || touch ~/.inputrc
if ! grep -q 'Source dotfiles' ~/.inputrc; then
	echo -e "# Source dotfiles\n\$include $DIR/inputrc\n" | cat - ~/.inputrc >_tmp && mv _tmp ~/.inputrc
	echo "Installed in .inputrc"
fi

