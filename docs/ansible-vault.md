# Ansible Vault

## Create encrypted_file.yml
`
ansible-vault create --vault-id=my_vault_id@prompt my_encrypted_file.yml
`

## Create vault with encrypted_file.yml
`
ansible-vault create --vault-id=my_vault_id@/path/to/my_vault_password_file.txt my_encrypted_file.yml
`  
