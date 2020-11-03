#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in

	
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

reset_color='\033[0m'        # Reset color
txtBlack='\033[0;30m'        # Black
txtWhite='\033[0;97m'        # White
txtGrey='\033[0;90m'         # Dark Gray
txtred='\033[0;31m'          # Red
txtGreen='\033[0;32m'        # Green
txtYellow='\033[0;33m'       # Yellow
txtBlue='\033[0;34m'         # Blue
txtPurple='\033[0;35m'       # Purple
txtCyan='\033[0;36m'         # Cyan
lightBlack='\[\033[1;30m\]'  # light Black
lightGrey='\033[0;37m'       # Ligth Gray
lightRed='\033[0;91m'        # Ligth Red
lightGreen='\033[0;92m'      # Ligth Green
lightYellow='\033[0;93m'     # Ligth Yellow
lightBlue='\033[0;94m'       # Ligth Blue
lightPurple='\033[0;95m'     # Light Purple
lightCyan='\033[0;96m'       # Ligth Cyan


git_branch ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo "($branch)"
}

PS1='$(if git rev-parse --git-dir > /dev/null 2>&1; then if git diff --quiet 2>/dev/null >&2; then  echo "'${lightGreen}'"; else echo "'${lightRed}'"; fi fi)'
PS1+='$(git_branch)'
PS1="\n${lightBlack}\A ${txtCyan}\u${lightGreen}@${lightBlue}\h ${txtPurple}\W ${PS1}"    
PS1="${PS1}\n ${txtWhite}→ ${lightGreen}"


#         _  _                                                                     _
#        | |(_)                                                                   | |
#   __ _ | | _   __ _  ___     ___   ___   _ __ ___   _ __ ___    __ _  _ __    __| | ___
#  / _` || || | / _` |/ __|   / __| / _ \ | '_ ` _ \ | '_ ` _ \  / _` || '_ \  / _` |/ __|
# | (_| || || || (_| |\__ \  | (__ | (_) || | | | | || | | | | || (_| || | | || (_| |\__ \
#  \__,_||_||_| \__,_||___/   \___| \___/ |_| |_| |_||_| |_| |_| \__,_||_| |_| \__,_||___/
#-----------------------------------------------------------------------------------------
alias ll="ls -AlhF --group-directories-first --color=auto"
alias lm="ls -altr"
alias x="exit"
alias q="exit"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias vi="vim"

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias update="sudo pacman -Syu"
alias clean="sudo pacman -Sc"
alias vi="vim"
alias c="code ."


alias glog="git log"
alias gstat="git status"
alias gadd="git add"
alias gcom="git commit"
alias gbranch="git branch"
alias gch="git checkout -b"
alias gsw="git switch"
alias gac="git add -A && git commit -m"
alias gp="git push"
alias gpull="git pull"
alias gback="git restore . && git clean -df"
alias gdiff="git diff"
alias gmer="git merge"
alias gcpick="git cherry-pick"

alias lampp="sudo /opt/lampp/lampp"
alias lsvr="cd /opt/lampp/htdocs"
alias laravel="composer create-project --prefer-dist laravel/laravel"
alias pa="php artisan"
alias pamf="php artisan migrate:fresh"
alias parl="php artisan route:list -c"

cd () { builtin cd "$@" && ls; }
mkd() { mkdir -p "$@" && cd "$@"; }
trash () { gvfs-trash "$@" && ls;  }
