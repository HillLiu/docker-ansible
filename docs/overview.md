# Overview

* [Ansible Doc](https://docs.ansible.com/ansible/latest/)

```
docker run --rm -u $(id -u):$(id -g) -it -v $(pwd):/app hillliu/ansible ansible-playbook --version

ansible-galaxy collection list
ansible --version
```

## Explore more Doc from command

```
docker run --rm -it hillliu/ansible ansible-doc -t callback -l
```
