#!/bin/bash

librewolf &
kitty &

sleep 1

wait_for_window() {
    local pattern="$1"
    local id
    for i in {1..10}; do
        id=$(xdotool search --onlyvisible --name "$pattern" 2>/dev/null)
        if [ -n "$id" ]; then
            echo "$id"
            return 0
        fi
        sleep 1
    done
    return 1
}

librewolf_id=$(wait_for_window 'olf') || { echo "error: LibreWolf"; exit 1; }
kitty_id=$(wait_for_window 'Kitty|~') || { echo "error: kitty"; exit 1; }
xdotool windowsize "${librewolf_id}" 2082 2107
xdotool windowmove "${librewolf_id}" 12 9
xdotool windowsize "${kitty_id}" 1704 2065
xdotool windowmove "${kitty_id}" 2092 29