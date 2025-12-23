#!/bin/bash

cd $HOME/fun/notes/
source .env/bin/activate
mkdocs serve --livereload -a localhost:$PORT