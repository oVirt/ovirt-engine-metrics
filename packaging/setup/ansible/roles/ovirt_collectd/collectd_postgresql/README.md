## Ovirt_collectd/Collectd_postgresql

This role configures collectd postgresql plugin to collect
PostgreSQL database statistics: custom_deadlocks, table_states, disk_io, disk_usage.

The available variables for this role are:

- `configure_collectd_postgresql:`  (default: `"true"`)

  Whether to configure collectd_postgresql


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `configure_collectd_postgresql`,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "configure_collectd_postgresql=false"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    configure_collectd_postgresql: false

You don't need to update the configuration file if you wish to use default options.
