# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Variables
export EDITOR=vim
export NLS_LANG=AMERICAN_POLAND.UTF8

# Functions
function dv {
	delim=${1:-';'}
	shift
	perl -pe 's/((?<='"${delim}"')|(?<=^))'"${delim}"'/ '"${delim}"'/g;' "$@" | column -t -s"$delim"
}

# Aliases
alias _='sudo'
alias l='ls'
alias sl='ls'
alias lt='ls -ltr | tail'
alias myps='ps -fu `id -un`'
alias e="env -0 | sort -z | xargs -0 -L1"
alias ..="cd .."
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- --='cd -'
alias x='exit'
alias cronlist='crontab -l'
alias cronedit='crontab -e'
alias be='bundle exec'
alias hrr='hr "#" "#" "#"'
alias hrrr='hr "#" "#" "#" "#" "#" "#" "#" "#" "#"'
alias sum='paste -sd+ | bc'

# Ruby & RVM
PATH=$PATH:$HOME/bin:$HOME/.rvm/bin
unset RUBYOPT

# Prompt
prompt_command() {
	STATUS=$?

	r='\[\e[0;31m\]'
	R='\[\e[1;31m\]'
	g='\[\e[0;32m\]'
	G='\[\e[1;32m\]'
	y='\[\e[0;33m\]'
	Y='\[\e[1;33m\]'
	b='\[\e[0;34m\]'
	B='\[\e[1;34m\]'
	p='\[\e[0;35m\]'
	P='\[\e[1;35m\]'
	c='\[\e[0;36m\]'
	C='\[\e[1;36m\]'
	w='\[\e[0;37m\]'
	W='\[\e[1;37m\]'
	NC='\[\e[0m\]'
	
	PS1="$c[\A]"                                 # Time
	PS1+=" $G\u@\h"                              # User, host
	PS1+=" $B\w"                                 # Dir
	[[ ${STATUS} == 0 ]] || PS1+=" $p($STATUS)"  # Exit code, if present
	PS1+=" $B\$ $NC"                             # Sign
}

PROMPT_COMMAND=prompt_command

# Other
shopt -s histappend
