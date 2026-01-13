#!/bin/bash

# Add track_name, artist_name, album_name and album_artist_name to a .m4a file
metaudio() {
    if [ "$#" -ne 4 ]; then
        echo "Usage: metaudio 'input.m4a' 'track_name' 'artist_name' 'album_name'"
        return 1
    fi

    local input_file="$1"
    local track_name="$2"
    local artist_name="$3"
    local album_name="$4"

    ffmpeg -i "$input_file" \
        -c copy \
        -metadata title="$track_name" \
        -metadata artist="$artist_name" \
        -metadata album_artist="$artist_name" \
        -metadata album="$album_name" \
        "$track_name - $artist_name.m4a"
}