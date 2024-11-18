# Curl

## Curl pipe to bash example
* <https://stackoverflow.com/questions/47994497/how-to-pipe-commands-using-ansible-e-g-curl-sl-host-com-sudo-bash>
```
- name: Add repository
  shell: curl -sL https://deb.nodesource.com/setup | sudo bash -
  args:
    warn: no
```
