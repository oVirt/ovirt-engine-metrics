## oVirt.logging

This role runs dependent linux-system-roles-logging roles, Roles list is located in the meta directory.

It is run as part of the `Configure Metrics` play and the default `configure` tag.

The available variables for this role are:

- `logging_output_type:` (default: `"elasticsearch"`)

  Default output plugin. Currently, this is the only output supported for this role.

- `logging_owner:` (default: `"root"`)

  User that will own logging config files.

- `logging_group:` (default: `"root"`)

  Group that will own logging config files.

- `logging_config_mode:` (default: `"0640"`)

  File mode for logging configuration files.

- `logging_role_path:` (default: `"/usr/share/ansible/roles/oVirt.metrics/roles/oVirt.linux-system-roles-logging"`)

  Path to the linux-system-roles-logging role directory.

- `collect_ovirt_vdsm_log:` (default: `"true"`)

  By setting this variable to false, vsdm logs will not be collected.

- `collect_ovirt_engine_log:` (default: `"true"`)

  By setting this variable to false, engine logs will not be collected.

- `collect_ovirt_collectd_metrics:` (default: `"true"`)

  By setting this variable to false, Collectd metrics will not be collected.


# Relevant only to elasticsearch output plugin

- `fluentd_elasticsearch_ca_cert_path:` (default: `'{{ fluentd_config_dir }}/elasticsearch_ca_cert.pem'`)

  Where to find the Fluentd CA certificate used to communicate with Elasticsearch

- `fluentd_elasticsearch_client_cert_path:` (default: `'{{ fluentd_config_dir }}/elasticsearch_client_cert.pem'`)

  Where to find the Fluentd client certificate used to communicate with Elasticsearch

- `fluentd_elasticsearch_client_key_path:` (default: `'{{ fluentd_config_dir }}/elasticsearch_client_key.pem'`)

  Where to find the Fluentd client certificate used to communicate with Elasticsearch

- `fluentd_elasticsearch_ca_cert:`

  Content of an x509 Fluentd Elasticsearch CA certificate that will be used to identify the
  server to clients.

- `fluentd_elasticsearch_client_cert:`

  Content of an x509 Fluentd Elasticsearch client certificate that will be used to
  authenicate to Elasticsearch.

- `fluentd_elasticsearch_client_key:`

  Content of an x509 Fluentd Elasticsearch client key that will be used to
  authenicate to Elasticsearch.


In order to set these variable add the required variables to a file in
/etc/ovirt-engine-metrics/config.yml.d/ or in the command line.

For example, if you want to update the `fluentd_elasticsearch_ca_cert_path`,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "fluentd_elasticsearch_ca_cert_path=/path/to/cacert"


or add the following line to a file you create in /etc/ovirt-engine-metrics/config.yml.d/
and run configure_ovirt_machines_for_metrics.sh

::

    fluentd_elasticsearch_ca_cert_path: /path/to/cacert

You don't need to update the configuration file if you wish to use default options.
