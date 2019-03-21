#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
export PS1="༒ [ \w ] ->"