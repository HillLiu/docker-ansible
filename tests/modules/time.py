from ansible.module_utils.basic import AnsibleModule

import datetime

# https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html
def main():

    module_args = dict(
        name=dict(type='str', required=True),
        new=dict(type='bool', required=False, default=False)
    )

    # Create the Ansible module
    module = AnsibleModule(
        argument_spec = module_args,
        supports_check_mode=True
    )

    result = dict()

    result['name'] = module.params['name']

    # Get the current time
    result['time'] = str(datetime.datetime.now())

    if module.params['new']:
        result['changed'] = True
    if module.params['name'] == 'failed':
        module.fail_json(msg='You requested this to fail', **result)

    # Return the current time as the result
    module.exit_json(**result)

if __name__ == '__main__':
    main()

