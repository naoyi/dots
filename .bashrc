export PS1='PS1="\u@\h:\[\e[1;38;2;128;165;100m\]\w\[\e[0m\]\$ '

# Run "startx" after login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx 
