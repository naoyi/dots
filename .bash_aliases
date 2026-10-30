#!/bin/bash

alias "ls"="ls --color=auto --group-directories-first"
alias "lastoff"="last -1x shutdown | awk 'NR==1 {print \$5, \$6, \$7, \$8}'"
alias "mpv"="mpv --profile=gpu-hq --hwdec=auto"
alias "neofetch"="echo && neofetch"
alias "off"="sudo poweroff"
alias "purge"="sudo apt autoremove --purge"
alias "reboot"="sudo reboot"
alias "run-frida-server"='adb shell "/data/local/tmp/frida-server &"'
alias "suspend"="sudo systemctl suspend"
alias "serve_notes.sh"="$HOME/utils/scripts/serve_notes.sh"
alias "todo"="hx $HOME/utils/notes/todo.txt"
alias "musage"='ps aux --sort=-%mem | head -n 40 | awk '"'"'NR>1 {n=split($11,a,"/"); print a[n]}'"'"' | sort -u'
alias "ytdlp-audio"='yt-dlp -f "ba[ext=m4a]"'
