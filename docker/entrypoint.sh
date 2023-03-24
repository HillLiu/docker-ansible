#!/usr/bin/env sh

# docker entrypoint script
server() {
  tail -f /entrypoint.sh
}

if [ -e "/key" ]; then
  eval $(ssh-agent -a /usr/local/ssh-auth-sock)
  ssh-add /key
fi

if [ "$1" = 'server' ]; then
  server
else
  exec "$@"
fi
