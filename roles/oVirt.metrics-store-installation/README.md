## oVirt.metrics-store-installation

This role generates the inventory and vars.yml files,
required for the OpenShift + Logging installation and copies it
to the metrics store machine.

The available variables for this role are:

- `vars_yaml_file_path:`(default: `/root/vars.yml`)

  Path to var.yml file that will be used for the Viaq logging installation.

- `ansible_inventory_files_path:`(default: `/root/`)

  Path to ansible inventory file that will be used for the Viaq logging installation

In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `ansible_inventory_files_path`,
you would need to run the oVirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "ansible_inventory_files_path=/tmp/"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    ansible_inventory_files_path: /tmp/

You don't need to update the configuration file if you wish to use default options.
