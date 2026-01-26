export PS1='PS1="\u@\h:\[\e[1;38;2;128;165;100m\]\w\[\e[0m\]\$ '

# Run "startx" after login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
	source "${HOME}/.bash_aliases"
fi

# Functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi
