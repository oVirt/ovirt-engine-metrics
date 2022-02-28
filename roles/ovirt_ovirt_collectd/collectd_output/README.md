## ovirt_ovirt_collectd/Write-http

This role configures collectd to send the metrics by http.

The available variables for this role are:

- `collectd_write_http_host:`  (default: `"localhost"`)

  The host that collectd will write to using http

- `collectd_write_http_port:` (default: `"9880"`)

  The port that collectd will write to using http. This is the default
  port on which fluentd listens for http data.

- `collectd_write_http_url:`
  (default: `"http://{{ collectd_write_http_host }}:
  {{ collectd_write_http_port }}/{{ collectd_write_http_path }}"`)

  The full URL that collectd will write to. Usually should not be changed.


In order to set these variable add the required variables to a file in
/etc/ovirt-engine-metrics/config.yml.d/ or in the command line.

For example, if you want to update the `collectd_write_http_port` to 8888,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "collectd_write_http_port=8888"


or add the following line to a file you create in /etc/ovirt-engine-metrics/config.yml.d/
and run configure_ovirt_machines_for_metrics.sh

::

    collectd_write_http_port: 8888

You don't need to update the configuration file if you wish to use default options.
