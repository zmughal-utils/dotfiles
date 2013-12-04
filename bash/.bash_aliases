# vim:ft=sh
alias ff='firefox'
alias bc='bc -l'
#alias info='info --vi-keys'
alias mutt_gmail='mutt -F .muttrc_gmail'

alias   l='ls -CF'
alias  la='ls -AF'
alias  ll='ls -lF'
alias lla='ls -AlF'

alias lsl='ls --color=always|less -R'
alias lll='ls -lF --color=always|less -R'
alias pstl='pstree|less' 

alias mv='mv -i'
alias cp='cp -pi'

alias c='cd'
alias v='vi'

alias fail='tail -f'

#alias ..='cd ..'
alias ..='up'

alias ..g='git rev-parse && cd "$(git rev-parse --show-toplevel)"'

alias lt='ls -lrt'

if which ls++ >/dev/null; then
	unalias ll
	alias ll='ls++'
fi

# Colour grep
alias egrep='egrep --color=tty'
alias fgrep='fgrep --color=tty'
alias grep='grep --color=tty'

alias remind='remind -w$COLUMNS'

alias p='pdl2'
if which ack-grep 2>&1 > /dev/null; then
	true; #alias ack='ack-grep'
fi

function cdd() {
	FILE="$@"
	if [ -f "$FILE" ]; then
		FILE=`dirname "$FILE"`
	fi
	cd "$FILE"
}
#if which colormake >/dev/null; then
	#alias make='colormake'
#fi

if which colorit >/dev/null; then
	function dict() {
			/usr/bin/dict "$@" | colorit -c /etc/dictd/colorit.conf
	}
fi

# <http://orangesplotch.com/bash-going-up/>
# Go up directory tree X number of directories
function up() {
	COUNTER="$@";
	END_OLDPWD="$PWD"
	# default $COUNTER to 1 if it isn't already set
	if [[ -z $COUNTER ]]; then
		COUNTER=1
	fi
	# make sure $COUNTER is a number
	if [ $COUNTER -eq $COUNTER 2> /dev/null ]; then
		nwd="`pwd`" # Set new working directory (nwd) to current directory
		# Loop $nwd up directory tree one at a time
		until [[ $COUNTER -lt 1 ]]; do
			nwd=`dirname "$nwd"`
			let COUNTER-=1
		done
		cd "$nwd" # change directories to the new working directory
	else
		# print usage and return error
		echo "usage: up [NUMBER]"
		return 1
	fi
	OLDPWD="$END_OLDPWD"
}
