## Fluentd

This role runs dependent fluentd roles, Roles list is located in the meta directory.

It is run as part of the `Configure Metrics` play and the default `configure` tag.
It also includes the `restart fluentd` handler.


The available variables for this role are:

- `fluentd_service_name:`  (default: `"fluentd"`)

  Fluentd service name.

- `fluentd_config_dir:` (default: `"/etc/fluentd"`)

  Path to the Fluentd configuration directory.

- `fluentd_config_file:` (default: `"{{ fluentd_config_dir }}/fluent.conf"`)

  Path to the main Fluentd configuration file.

- `fluentd_config_parts_dir:` (default: `"/etc/fluentd"`)

  Path to the directory containing Fluentd configuration snippets.

- `fluentd_owner:` (default: `"root"`)

  User that will own Fluentd config files.

- `fluentd_group:` (default: `"root"`)

  Group that will own Fluentd config files.

- `fluentd_config_mode:` (default: `"0640"`)

  File mode for Fluentd configuration files.

- `fluentd_use_ssl:` (default: `"false"`)

  Set to true if Fluentd should use SSL.

- `fluentd_shared_key:`

  Shared secret key for SSL connections.

- `fluentd_ca_cert_path:` (default: `"{{ fluentd_config_dir }}/ca_cert.pem"`)

  File mode for Fluentd configuration files.

- `fluentd_ca_cert:`

  Content of an x509 certificate that will be used to identify the server to clients.


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `fluentd_config_dir`,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "fluentd_config_dir=/path/to/config"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    fluentd_config_dir: /path/to/config

You don't need to update the configuration file if you wish to use default options.
