# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Home
XHOME=${1:-$HOME}

# Variables
export EDITOR=vim
export NLS_LANG=AMERICAN_POLAND.UTF8

# Aliases
alias _='sudo'
alias l='ls'
alias sl='ls'
alias myps='ps -fu `id -un`'
alias e="env | sort"
alias ..="cd .."
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- --='cd -'
alias x='exit'
alias cronlist='crontab -l'
alias cronedit='crontab -e'
alias be='bundle exec'

# Ruby & RVM
PATH=$PATH:$XHOME/bin:$XHOME/.rvm/bin
unset RUBYOPT

# Local settings
[[ -r "$XHOME/.bashrc.local" ]] && source "$XHOME/.bashrc.local"

