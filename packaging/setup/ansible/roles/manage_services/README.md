## Manage_services

This role manages collectd and fluentd services on the oVirt machines
It can start (default) / restart / reload / stop the services.

It can enable / disable the services.


In order to run this role you will need to pass the tag `manage_services`, like this:

    configure_ovirt_machines_for_metrics.sh --tags=manage_services



In order to set the required action there are the following variables


- `service_enabled:`  (default: `"yes"`)

  Set this to no if you don't what to enable the process

- `service_state:` (default: `"restarted"`)

  Set this to the required action. Optional values are: started, restarted, stopped reloaded.

- `service_name:` (default: `["collectd", "fluentd"`])

  A list of the the services that will be managed by the role.


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to stop collectd and fluentd services,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh --tags=manage_services -e "service_state=stopped"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    service_state: stopped

You don't need to update the configuration file if you wish to use default options.
