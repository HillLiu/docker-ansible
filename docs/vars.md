# Vars

## host var vs groups var
* <<https://www.rogerperkin.co.uk/network-automation/ansible/what-are-host_vars-and-group_vars-in-ansible/>>

* Vars Order
  1. command line values (for example, -u my_user, these are not variables)
  1. role defaults (defined in role/defaults/main.yml) 
  1. inventory file or script group vars 
  1. inventory group_vars/all 
  1. playbook group_vars/all 
  1. inventory group_vars/* 
  1. playbook group_vars/* 
  1. inventory file or script host vars 
  1. inventory host_vars/* 
  1. playbook host_vars/* 
  1. host facts / cached set_facts 
  1. play vars
  1. play vars_prompt
  1. play vars_files
  1. role vars (defined in role/vars/main.yml)
  1. block vars (only for tasks in block)
  1. task vars (only for the task)
  1. include_vars
  1. set_facts / registered vars
  1. role (and include_role) params
  1. include params
  1. extra vars (for example, -e "user=my_user")(always win precedence)

## include_vars_module
* [include_vars_module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_vars_module.html)
