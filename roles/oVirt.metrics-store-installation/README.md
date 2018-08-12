## oVirt.metrics-store-installation

This role generates the inventory and vars.yml files,
required for the OpenShift + Logging installation and copies it
to the metrics store machine.

The available variables for this role are:

- `openshift_distribution:`(default: `origin`)
  The OpenShift distribution to install.
  Valid options are `origin` and `ocp`.

- `openshift_version:`(default: `39`)
  The OpenShift version to install.
  Valid options are `39` and `310`.

- `openshift_ansible_files_path:`(default: `/root`)

  Path to OpenShift Logging ansible inventory and vars files.

- `ovirt_elasticsearch_mounted_storage_path:`(default:`/var/lib`)

  Path to Elasticsearch persistent storage preallocated partition.

In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `openshift_ansible_files_path`,
you would need to run the oVirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "openshift_ansible_files_path=/tmp"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    openshift_ansible_files_path: /tmp

You don't need to update the configuration file if you wish to use default options.
