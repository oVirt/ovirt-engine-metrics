## oVirt.metrics-store-installation

This role runs dependent metrics store installation roles, Roles list is located in the meta directory.

It is run as part of the `Configure Metrics`.


The available variables for this role are:

- `viaq_metrics_store:`  (default: `"true"`)

  This parameter determins if to setup the OpenShift based EFK metrics store.

In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `viaq_metrics_store`,
you would need to run the oVirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "viaq_metrics_store=false"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    viaq_metrics_store: false

You don't need to update the configuration file if you wish to use default options.
