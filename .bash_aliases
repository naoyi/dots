#!/bin/bash

alias "suspend"="sudo systemctl suspend"
alias "off"="sudo poweroff"

alias "run-frida-server"='adb shell "/data/local/tmp/frida-server &"'
alias "serve_notes"="$HOME/utils/scripts/serve_notes.sh"
alias "todo"="hx $HOME/utils/notes/todo.txt"
alias "ytdlp-audio"='yt-dlp -f "ba[ext=m4a]"'
