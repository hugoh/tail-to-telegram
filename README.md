# (Reliable) Tail to Telegram

Hacked up version of tailing a file to send to Telegram reliably.

Uses <https://github.com/minfrin/retry> and
<https://pypi.org/project/telegram-send/>.

## Installation

```sh
git clone git@github.com:hugoh/tail-to-telegram.git
cd tail-to-telegram
./setup.sh
```

## Configuration

Configure Telegram with:

```sh
. ./venv/bin/activate
telegram-send --config ./telegram.conf --configure
```

Create a `ttt.conf` that looks like:

```conf
TELEGRAM_CONF=telegram.conf
TAILED_FILES=(/var/log/syslog)
DELAY=30    # retry every 30 seconds
TIMES=1830  # retry for a week (give or take)
```

## Run

```sh
./tail-to-telegram.sh
```
