## Ovirt_collectd/Read_statsd

This role configures collectd statsd plugin to collect virtual machines statistics,
CPU, memory, disk, and network I/O, from vdsm.

The available variables for this role are:

- `collectd_read_statsd_port:`  (default: `"8125"`)

  The port that collectd will listen on for incoming statsd data

- `collectd_read_statsd_bind_host:` (default: `"localhost"`)

  The address that collectd will listen on for incoming statsd data


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `collectd_read_statsd_port` to 8888,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "collectd_read_statsd_port=8888"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    collectd_read_statsd_port: 8888

You don't need to update the configuration file if you wish to use default options.
