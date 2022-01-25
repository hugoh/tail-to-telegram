#!/bin/sh

cd "$(dirname "$0")" || exit 1
python3 -mvenv venv
# shellcheck disable=SC1091
. ./venv/bin/activate
pip3 install telegram-send
command -v retry > /dev/null 2>&1 || echo "Please install https://github.com/minfrin/retry"
