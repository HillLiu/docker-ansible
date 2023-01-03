# Ansible Vault

* [Ansible Valut Doc](https://docs.ansible.com/ansible/latest/vault_guide/vault.html)

## Create encrypted_file.yml
`
ansible-vault create --vault-id=my_vault_id@prompt my_encrypted_file.yml
`

## Create vault with encrypted_file.yml
`
ansible-vault create --vault-id=my_vault_id@/path/to/my_vault_password_file.txt my_encrypted_file.yml
`  
## With docker
```
docker run --rm -u $(id -u):$(id -g) -it -v $(pwd):/app hillliu/ansible ansible-vault encrypt --vault-id=./xxx.key ./xxx.yaml 
```
