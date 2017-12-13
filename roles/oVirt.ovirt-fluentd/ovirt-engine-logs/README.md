## oVirt.ovirt-fluentd/Ovirt-engine-logs

This role configures fluentd to parse oVirt engine logs
and add additional metadata before sending them to the remote metrics store.

The following metadata is added to each metrics:

- `hostname`

  The hostname that the metric is collected from.

- `ipaddr4`

  The ipv4 address of the host the metric is collected from.

- `service`

  The name for the collected log file.

- `tag`

  This field can be used for several tags.
  Currently it holds the prefixs of the elasticsearch index the logs will be saved to. Like, project.ovirt-logs-<ovirt_env_name>


In order to set the required action there are the following variables


- `fluentd_pos_files_dir:`  (default: `"/var/lib/ovirt-fluentd/pos-files"`)

  Path to the Fluentd configuration directory.

- `fluentd_ovirt_engine_log_pos_file:` (default: `"{{ fluentd_pos_files_dir }}/ovirt-engine.log.pos"`)

  Path to the oVirt engine.log file.

- `fluentd_pos_files_mode:` (default: `"0640"`)

  File mode for Fluentd configuration files.

- `fluentd_pos_files_dir_mode:` (default: `"0750"`)

  File mode for Fluentd configuration directories.


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update `fluentd_pos_files_dir`,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "fluentd_pos_files_dir=/path/to/dir"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    fluentd_pos_files_dir: /path/to/dir

You don't need to update the configuration file if you wish to use default options.
