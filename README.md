oVirt Engine Metrics
====================
[![Copr build status](https://copr.fedorainfracloud.org/coprs/ovirt/ovirt-master-snapshot/package/ovirt-engine-metrics/status_image/last_build.png)](https://copr.fedorainfracloud.org/coprs/ovirt/ovirt-master-snapshot/package/ovirt-engine-metrics/)

Welcome to the oVirt Engine Metrics source repository. This repository is hosted on [GitHub:ovirt-engine-metrics](https://github.com/oVirt/ovirt-engine-metrics).

The `oVirt.metrics` role enables you to deploy and configure rsyslog/fluentd and collectd on the engine and hypervisors to send metrics and logs to a remote Elasticsearch and manage the services.

Role Variables
--------------

### Configure metrics
This role configures collectd and rsyslog or fluentd services on the oVirt engine and hypervisors,
to be able to send metrics and logs to a remote metrics store.

In order to run this role you will need to run:

     configure_ovirt_machines_for_metrics.sh

You will need to set the following variables:

- `ovirt_env_name:` (required - default: `"engine"`)

  Environment name. Is used to identify data collected in a single central
  store sent from more than one oVirt engine.
  Maximum field length is 49 characters.
  For more details see:
  https://www.ovirt.org/develop/release-management/features/metrics/metrics-store-installation/#ovirt-metrics-store-setup

- `elasticsearch_host:` (required - no default value)

  Address or hostname (FQDN) of the Elasticsearch server host. The value is a single host or list of hosts.

- `manage_services:` (default: `"true"`)

  If set to true, fluentd and collectd services will be enabled.

- `manage_packages:` (default: `"true"`)

  If set to true, all defined collectd and fluentd packages will be installed / updated to latest.


### Manage Services
This role manages collectd and fluentd services on the oVirt machines
It can start (default) / restart / reload / stop the services.

It can also enable / disable the services.


In order to run this role you will need to run:

     configure_ovirt_machines_for_metrics.sh --playbook=manage-ovirt-metrics-services.yml -vvv


You will need to set the following variables:

- `service_enabled:`  (default: `"yes"`)

  Set this to no if you don't what to enable the process

- `service_state:` (default: `"restarted"`)

  Set this to the required action. Optional values are: started, restarted, stopped reloaded.

- `service_name:` (default: `["collectd", "fluentd"`])

  A list of the the services that will be managed by the role.

In order to set these variable add the required variables to a file in
/etc/ovirt-engine-metrics/config.yml.d/ or in the command line.

### Cleanup oVirt Metrics
This role stops and disables Collectd, Fluentd and restores Rsyslog to default configurations.
After running this role, user can delete the oVirt metrics store VMs.

In order to run this role you will need to run:

     configure_ovirt_machines_for_metrics.sh --playbook=cleanup-ovirt-metrics.yml -vvv


### Submitting patches

Please submit patches to [GitHub:ovirt-engine-metrics](https://github.com/oVirt/ovirt-engine-metrics). If you are not familiar with the process, you can read about [collaborating with pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests) on the GitHub website.

### Found a bug or documentation issue?

To submit a bug or suggest an enhancement for oVirt Engine Metrics please use [GitHub issues](https://github.com/oVirt/ovirt-engine-metrics/issues). If you find a documentation issue on the oVirt website, please navigate to the page footer and click "Report an issue on GitHub".

## Still need help?

If you have any other questions or suggestions, you can join and contact us on the [oVirt Users forum / mailing list](https://lists.ovirt.org/admin/lists/users.ovirt.org/).
