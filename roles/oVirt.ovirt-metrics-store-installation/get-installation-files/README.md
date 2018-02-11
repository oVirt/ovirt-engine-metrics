## oVirt.metrics-store-setup/get-installation-files

This role generates the inventory and vars.yml files,
required for the OpenShift + Logging installation and copies it
to the metrics store machine.

The available variables for this role are:
- `openshift_enterprise_release:`(default: `3.6`)

  The OpenShift enterprise release that will be installed.

- `openshift_origin_release:`(default: `3.7`)

  The OpenShift origin release that will be installed.

- `vars_yaml_file_path:`(default: `/root/vars.yml`)

  Path to var.yml file that will be used for the Viaq logging installation.

- `ansible_inventory_file_path:`(default: `/root/ansible-inventory`)

  Path to ansible inventory file that will be used for the Viaq logging installation
