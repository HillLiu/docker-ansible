#!/usr/bin/env sh

# docker entrypoint script
server() {
  tail -f /entrypoint.sh
}

if [ -e "/key" ]; then
  eval $(ssh-agent -a /usr/local/share/ssh-auth-sock)
  for key in /key*; do
    ssh-add $key
  done
fi

# init ~/.ssh/config
mkdir -p ~/.ssh/
for sshconfig in /sshconfig*; do
  if [ -f "$sshconfig" ]; then
    cat $sshconfig >> ~/.ssh/config
    echo "" >> ~/.ssh/config
  fi
done

if [ "$1" = 'server' ]; then
  server
else
  exec "$@"
fi
