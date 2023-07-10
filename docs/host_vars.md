# HostVars

## Get host data example
```
- name: Get host data
  setup:
    filter: ansible_hostname
  register: hostData
- debug: var=hostData
```

## hostvars debug
```
ansible -i hosts all -m debug -a "var=hostvars[inventory_hostname]"
```

## More tips
* <https://admantium.medium.com/ansible-working-with-variables-and-hostvars-479c9d3f4f54>
