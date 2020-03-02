#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto' 
PS1="\[\e[0m\]\u \w > \[\e[4m\]"
trap 'tput sgr0' DEBUG



