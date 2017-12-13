## oVirt.ovirt-fluentd/Http-input

This role configures Fluentd to allow http input, currently from a local
collectd.


The available variables for this role are:


- `fluentd_http_input_port:`  (default: `"9880"`)

  Port of the fluentd server host.

- `fluentd_http_input_bind_address:` (default: `"localhost"`)

  Address of the fluentd server host.


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update `fluentd_http_input_port` to 8888,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "fluentd_http_input_port=8888"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    fluentd_http_input_port: 8888

You don't need to update the configuration file if you wish to use default options.
