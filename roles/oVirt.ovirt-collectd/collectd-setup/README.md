## oVirt.ovirt-collectd/Collectd-setup

This role enables the service, sets collectd_tcp_network_connect
and stops the service if fluentd is not running.

It also configures collectd top-level configuration flie.

The available variables for this role are:

- `collectd_interval:`  (default: `"10"`)

   It controls the collection interval of the statistics.


In order to set these variables, add the required variables to the config.yml
or in the command line.

For example, if you want to update the `collectd_interval`,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "collectd_interval=10"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    collectd_interval: 20

You don't need to update the configuration file if you wish to use default options.
