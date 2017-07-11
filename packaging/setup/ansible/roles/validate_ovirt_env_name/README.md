## Validate_ovirt_env_name

This role checks that the 'ovirt_env_name' is a valid OpenShift namespace identifier.
It must include only alphanumeric and "-" characters.
It cannot begin with "-" or a number, and cannot end with a "-".
Its length must be up to 49 characters.
