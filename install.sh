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
if ! grep -q 'source.*/bashrc$' ~/.bashrc; then
	sed -i "1i# Source dotfiles\nsource $DIR/bashrc\n" ~/.bashrc
	echo "Installed in .bashrc"
fi

if ! grep -q 'source.*/bash_profile$' ~/.bash_profile; then
	sed -i "1i# Source dotfiles\nsource $DIR/bash_profile\n" ~/.bash_profile
	echo "Installed in .bash_profile"
fi

if ! grep -q 'source.*/vimrc$' ~/.vimrc; then
	sed -i "1i\" Source dotfiles\nsource $DIR/vimrc\n" ~/.vimrc
	echo "Installed in .vimrc"
fi

if ! grep -q 'path=.*/gitconfig$' ~/.gitconfig; then
	sed -i "1i# Source dotfiles\n[include]\npath=$DIR/gitconfig\n" ~/.gitconfig
	echo "Installed in .gitconfig"
fi

