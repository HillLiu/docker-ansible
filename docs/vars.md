# Vars

## Discovering variables: facts and magic variables
* <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html#package-requirements-for-fact-gathering>
* <https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html>

### ansible_hostname vs inventory_hostname
* ansible_hostname: the hostname from Gathering Facts
* ansible_fqdn: the full hostname from Gathering Facts
* inventory_hostname: hosname from inventory config

## host var vs groups var
* <https://www.rogerperkin.co.uk/network-automation/ansible/what-are-host_vars-and-group_vars-in-ansible/>
* <https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#understanding-variable-precedence> 

* Vars Order (from least to greatest (the last listed variables override all other variables))
  * 1 command line values (for example, -u my_user, these are not variables)
  * 2 role defaults (defined in role/defaults/main.yml) 
  * 3 inventory file or script group vars 
  * 4 inventory group_vars/all 
  * 5 playbook group_vars/all 
  * 6 inventory group_vars/* 
  * 7 playbook group_vars/* 
  * 8 inventory file or script host vars 
  * 9 inventory host_vars/* 
  * 10 playbook host_vars/* 
  * 11 host facts / cached set_facts 
  * 12 play vars
  * 13 play vars_prompt
  * 14 play vars_files
  * 15 role vars (defined in role/vars/main.yml)
  * 16 block vars (only for tasks in block)
  * 17 task vars (only for the task)
  * 18 include_vars
  * 19 set_facts / registered vars
  * 20 role (and include_role) params
  * 21 include params
  * 22 extra vars (for example, -e "user=my_user")(always win precedence)

## include_vars_module
* [include_vars_module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_vars_module.html)

## get python location
* [Python](./python.md)
