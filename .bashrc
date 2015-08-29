#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports {{{
export EDITOR=nvim
export BROWSER=chromium
export HISTSIZE=4096
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
# }}}
# Aliases {{{
alias ls='ls --color=auto --group-directories-first --time-style=+"%m.%d %H:%M" --classify'
alias ll='ls -l --color=auto --group-directories-first --time-style=+"%m.%d %H:%M" --classify'
alias la='ls -la --color=auto --group-directories-first --time-style=+"%m.%d %H:%M" --classify'
alias grep='grep --color=tty -d skip'
alias rm='rm -I'
alias cp='cp -rvi'
alias mv='mv -i'
alias df='df -h'
alias free='free -m'
alias q='exit'
alias r='ranger'
alias e='$EDITOR'
alias alerton='PS1="$PS1\a"'
alias alertoff='PS1="${PS1:0:-2}"'

alias clock='while :; do date "+%T"; sleep 1; done'
alias lock='~/bin/suppressed-lock'
# }}}
# Prompt {{{
PS1='\[\e[32m\] \$\[\e[0m\] '
PS2='\[\e[32m\] >\[\e[0m\] '
PS3='\[\e[32m\] >\[\e[0m\] '
PS4='\[\e[32m\] +\[\e[0m\] '
# }}}
# Functions {{{

#whatcolorisit - thing based on http://whatcolourisit.scn9a.org/
# usage: whatcolorisit
whatcolorisit() { 
	while :
		do
			clear
			X=$(date +%H%M%S)
			tput cup $(($(tput lines)/2)) $((($(tput cols)/2)-6))
			echo -ne "\033]11;#$X\a#$X"
			sleep 1
		done
}

#stopkill - send kill signal 19 and then 9 to search given
# usage: stopkill <valid pkill search>
stopkill() {
	if [ -n "$@" ] ; then
		pkill -19 $@
		pkill -9 $@
	fi
}
#go2bed - sleep for <variable> then lock and suspend system to ram
# usage: go2bed <valid sleep string>
go2bed() {
	sleep $1 | pv -t
	~/bin/suppressed-lock
	systemctl suspend
}

#fucking-keyboard - when your keyboard goes idle and xorg freaks out thus forgetting your settings
# usage: fucking-keyboard
fucking-keyboard() {
	xset -b                 
	xset r rate 300 40      
	xset s 2530
	xset +dpms              
	xset dpms 2530 2530 2530
}
#vman - colored manual pages in nvim
# usage: vman <command>
vman() { 
	nvim <(man "$@") +"setf man"
}

#ranger - start new ranger isntance only if theres not one running already
# usage: ranger
# ranger() {
# 	if [ -z "$RANGER_LEVEL" ]
# 	then
# 		ranger
# 	else
# 		exit
# 	fi
# }

#sp - spell check string with aspell
# usage: sp <string>
sp() {
	echo "$@" | aspell pipe
}
	
#man - colored manual pages
# usage: man <command>
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
# }}}

# vim: fdm=marker
