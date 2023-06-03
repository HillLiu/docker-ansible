# Python

## get python location

```
- name: get python location 
  python_requirements_info:
  register: python_info

- debug: var=python_info.python

- name: get python dist-packages 
  shell: |
    "{{python_info.python}}" -c "import sysconfig; print(sysconfig.get_path('purelib'))"
  register: package_info

- debug: var=package_info

```
