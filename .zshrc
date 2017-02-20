#!/usr/bin/zsh

. ${HOME}/.shrc
. ${HOME}/.aliases

bindkey -v             # vi key bindings
# bindkey -e             # emacs key bindings
bindkey ' ' magic-space  # also do history expansion on space

bindkey	'\e[2~' quoted-insert		\
	'\e[3~' delete-char		\
	'\e[5~'	beginning-of-history	\
	'\e[6~'	end-of-history		\
	'\e[1~'	beginning-of-line	\
	'\e[4~'	end-of-line

bindkey	-s '^p' "| less\n"

setopt CORRECT AUTO_MENU EXTENDED_GLOB

autoload -U compinit
compinit

autoload -U promptinit
promptinit

autoload -U zfinit
zfinit

if [ `id -un` = "root" ]
then SEP="%F{red}#%f"
else SEP="%{$fg_no_bold[white]%}@"
fi

### [time] user@host %
#PS1="%{$fg_no_bold[white]%}[%{$fg_bold[green]%}%T%{$fg_no_bold[white]%}] %{$fg_bold[white]%}%n${SEP}%{$fg_bold[white]%}hostname%{$fg_no_bold[white]%} > "
PS1="[%F{green}%B%T%b%f] %B%n%b${SEP}%Bhostname%b > %b"

### prompt for right side of screen
RPROMPT="%B%~%b"

### Prompt for MySQL
export MYSQL_PS1='[\d@\h] > '

HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100
HIST_IGNORE_ALL_DUPS=1
HIST_FIND_NO_DUPS=1
HIST_IGNORE_SPACE=1
HIST_SAVE_NO_DUPS=1
