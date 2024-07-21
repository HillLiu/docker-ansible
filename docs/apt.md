# APT

## Sample

```
- name: Add NodeSource Repository
  become: true
  apt_repository:
    repo: deb https://deb.nodesource.com/node_22.x {{ ansible_distribution_release|lower }} main
    state: present
    update_cache: yes
```

## ansible_lsb.codename -> ansible_distribution_release

-   <https://opendev.org/openstack/kolla-ansible/commit/620bb29f1acb5bbf43a549fc12b8d107284a1a89>
