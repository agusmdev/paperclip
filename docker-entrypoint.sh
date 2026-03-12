#!/bin/sh
set -e

# Fix ownership of mounted volume (runs as root, then drops to node)
if [ "$(id -u)" = "0" ]; then
  chown -R node:node /paperclip
  exec gosu node "$@"
fi

exec "$@"
