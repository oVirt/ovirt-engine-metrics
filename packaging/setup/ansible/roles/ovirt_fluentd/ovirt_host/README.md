## Fluentd/Ovirt_host

This role configures fluentd to process oVirt hosts collectd metrics
and add additional metadata before sending them to the remote metrics store.

It rewrites collectd JSON output to nest into a nested json, using the following plugin:
https://github.com/ViaQ/fluent-plugin-collectd-nest

The following metadata is added to each metrics:

- `hostname`

  The hostname that the metric is collected from.

- `ipaddr4`

  The ipv4 address of the host the metric is collected from.

- `tag`

  This field can be used for several tags.
  Currently it holds the prefixes of the elasticsearch index the metrics will be saved to.
  For example, project.ovirt-metrics-<ovirt_env_name>

- `ovirt.entity`

   What entity the metrics relates to. Can be one of: engine, hosts, vms.

- `ovirt.host_id`

  The uuid of the host, as it is saved in the engine database.

- `ovirt.engine_fqdn`

  The oVirt engine fqdn this host is a part of.
