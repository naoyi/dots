#!/usr/bin/env bash

set -u

if [[ $# -ne 1 || -z ${1:-} ]]; then
    echo "Usage: ram.sh <application-name>" >&2
    exit 1
fi

app="$1"
total_kb=0
matched=0

# get matching PIDs first.
mapfile -t pids < <(pgrep -f -- "$app" 2>/dev/null || true)

if [[ ${#pids[@]} -eq 0 ]]; then
    echo "No processes matching '$app' found." >&2
    exit 1
fi

for pid in "${pids[@]}"; do
    # basic sanity check.
    [[ "$pid" =~ ^[0-9]+$ ]] || continue

    # avoid counting this script itself and its parent shell.
    if (( pid == $$ || pid == PPID )); then
        continue
    fi

    smaps_file="/proc/$pid/smaps_rollup"

    # process may have exited, or we may not have permission.
    [[ -r "$smaps_file" ]] || continue

    pss_kb=$(
        awk '/^Pss:/ { sum += $2 } END { print sum + 0 }' \
            "$smaps_file" 2>/dev/null
    ) || continue

    matched=1
    total_kb=$(( total_kb + pss_kb ))
done

if (( matched == 0 )); then
    echo "No readable processes matching '$app' were found." >&2
    exit 1
fi

awk -v app="$app" -v kb="$total_kb" '
    BEGIN {
        printf "%s: %.2f GiB (%.2f MiB, %d KiB PSS)\n",
            app,
            kb / 1024 / 1024,
            kb / 1024,
            kb
    }
'