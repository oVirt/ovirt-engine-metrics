## oVirt.metrics-store-setup

This role creates files that contain the metrics and logs indexes UUIDs,
the certificates and creates an admin user on the metrics store machine.

It updates the curator configmap for the oVirt metrics index.

It adds an additional file to the `config.yml.d` directory,
that includes the metrics and logs indexes UUIDs and the certificates
collected from the metrics store.

The available variables for this role are:
- `curator_configmap_file_path:`(default: `/root/ovir_metrics_curator_configmap.yaml`)

   Path to copy curator configmap to, on the metrics store machine.

- `ovirt_metrics_curator_delete_days:`(default: `3`)

   oVirt metrics indexes older than the number of days stated here will be deleted.

In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `ovirt_metrics_curator_delete_days`,
you would need to run the oVirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "ovirt_metrics_curator_delete_days=2"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    ovirt_metrics_curator_delete_days: 2

You don't need to update the configuration file if you wish to use default options.
