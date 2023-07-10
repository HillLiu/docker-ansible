# Array Tip


## Append to ansible array
```
- name: Append Array 
   delegate_to: localhost
   set_fact:
     some_array: "{{ other_array | default([]) + [ one_item ] }}"
```

## set_fact to hostvar

-   <https://berndonline.medium.com/how-to-delegate-ansible-host-variables-with-set-fact-6e7c937d0f4c>

```
 - set_fact:
     hostData: "{{ hostData | combine({ 'unreachable': True}) }}"
   delegate_to: "{{ item }}"
   delegate_facts: true
   with_items: "{{ down }}"
```

## set_fact to exists dict

-   How to Append or Add items into Ansible Dictionary
-   How to create List of Dictionaries in Ansible
-   <https://www.middlewareinventory.com/blog/ansible-dict/>
