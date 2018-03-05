## oVirt.metrics-store-setup/get-installation-files

This role generates the inventory and vars.yml files,
required for the OpenShift + Logging installation and copies it
to the metrics store machine.

The available variables for this role are:

- `vars_yaml_file_path:`(default: `/root/vars.yml`)

  Path to var.yml file that will be used for the Viaq logging installation.

- `ansible_inventory_files_path:`(default: `/root/`)

  Path to ansible inventory file that will be used for the Viaq logging installation
