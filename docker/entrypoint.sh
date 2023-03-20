#!/usr/bin/env sh

# docker entrypoint script
server() {
  tail -f /entrypoint.sh
}

eval $(ssh-agent -a /usr/local/ssh-auth-sock)

if [ -e "/usr/local/key" ]; then
  ssh-add /usr/local/key
fi

if [ "$1" = 'server' ]; then
  server
else
  exec "$@"
fi
