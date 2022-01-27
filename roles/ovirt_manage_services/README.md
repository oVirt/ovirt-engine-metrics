## ovirt_manage_services

This role manages collectd , rsyslog and fluentd services on the oVirt machines
It can start (default) / restart / reload / stop the services.
It can enable / disable the services.


In order to run this role you will need to run:

     configure_ovirt_machines_for_metrics.sh --playbook=manage-ovirt-metrics-services.yml


In order to set the required action there are the following variables


- `service_enabled:`  (default: `"yes"`)

  Set this to no if you don't what to enable the process.

- `service_state:` (default: `"restarted"`)

  Set this to the required action. Optional values are: started, restarted, stopped reloaded.

- `service_name:` (default: `["collectd", "rsyslog", "fluentd"]`)

  A list of the the services that will be managed by the role.


In order to set these variables add the required variables to the config.yml
or in the command line.

For example, if you want to stop collectd, rsyslog and fluentd services,
you would need to run the oVirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh --playbook=manage-ovirt-metrics-services.yml -e "service_state=stopped"


or add the following line to the config.yml file

::

    service_state: stopped


and run configure_ovirt_machines_for_metrics.sh --playbook=manage-ovirt-metrics-services.yml

You don't need to update the configuration file if you wish to use default options.
