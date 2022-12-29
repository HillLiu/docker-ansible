# Ansible Become

Change to different use, if not specific user will use root

```
- name: Install package
  become: true
  apt:
    name: mypackage
    state: latest
```

## Change to another user
```
- name: Install package
  become: true
  become_user: myuser
  apt:
    name: mypackage
    state: latest
```
