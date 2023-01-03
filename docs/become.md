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

## Remote user

[playbooks_intro.html](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html#about-playbooks)
[Become Docs](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#become-plugins)
