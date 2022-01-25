#!/bin/bash

cd "$(dirname "$0")" || exit 1

# shellcheck disable=SC1091
. ./venv/bin/activate || exit 1

# shellcheck disable=SC1091
. ./ttt.conf || exit 1

TELEGRAM_TIMEOUT=300

while read -r line
do
    retry -d "$DELAY" -t "$TIMES" -- telegram-send --config "$TELEGRAM_CONF" --timeout $TELEGRAM_TIMEOUT "$line"
done < <(tail -n 0 -q -F "${TAILED_FILES[@]}") 
