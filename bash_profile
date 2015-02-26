# Home
XHOME=${1:-$HOME}

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ${XHOME}/.bashrc ]] && . ${XHOME}/.bashrc

# RVM
[[ -s "$XHOME/.rvm/scripts/rvm" ]] && source "$XHOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r $rvm_path/scripts/completion  ]] && . $rvm_path/scripts/completion

# Local settings
[[ -r "$XHOME/.bash_profile.local"  ]] && source "$XHOME/.bash_profile.local"

