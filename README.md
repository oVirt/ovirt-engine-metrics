oVirt Engine Metrics
====================

The `oVirt.metrics` role enables you to set up oVirt Metrics store, deploy fluentd and collectd on the engine and hypervisors
and manage the services.

Role Variables
--------------

### Configure metrics
This role configures collectd and fluentd services on the oVirt engine and hypervisors,
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

- `fluentd_elasticsearch_host:` (required - no default value)

  Address or hostname (FQDN) of the Elasticsearch server host.

- `ovirt_env_uuid_metrics:` (required - no default value)

  UUID of the project/namespace used to store metrics records.
  This is used to construct the index name in Elasticsearch.
  For example, if you have ovirt_env_name: myenvname,
  then in logging OpenShift you will have a project named ovirt-metrics-myenvname.
  You need to get the UUID of this project like this:
  oc get project ovirt-metrics-myenvname -o jsonpath='{.metadata.uid}'

- `ovirt_env_uuid_logs:` (required - no default value)

  UUID of the project/namespace used to store log records.
  This is used to construct the index name in Elasticsearch.
  For example, if you have ovirt_env_name: myenvname,
  then in logging OpenShift you will have a project named ovirt-logs-myenvname.
  You need to get the UUID of this project like this:
  oc get project ovirt-logs-myenvname -o jsonpath='{.metadata.uid}'

- `fluentd_elasticsearch_ca_cert_path:` (required - no default value)

  The path to the file containing the CA certificate of the CA that issued
  the Elasticsearch SSL server cert.
  Get it from the logging OpenShift machine like this:
  oc get secret logging-fluentd --template='{{index .data "ca"}}' | base64 -d > fluentd-ca
  and use the local_fluentd_elasticsearch_ca_cert_path parameter in your ansible inventory
  or config file to pass in the file to use.

- `fluentd_elasticsearch_client_cert_path:` (required - no default value)

  The path to the file containing the SSL client certificate to use
  with certificate authentication to Elasticsearch.
  Get it from the logging OpenShift machine like this:
  oc get secret logging-fluentd --template='{{index .data "cert"}}' | base64 -d > fluentd-cert
  and use the local_fluentd_elasticsearch_client_cert_path parameter in your ansible inventory
  or config file to pass in the file to use.

- `fluentd_elasticsearch_client_key_path:` (required - no default value)

  The path to the file containing the SSL client key to use
  with certificate authentication to Elasticsearch.
  Get it from the logging OpenShift machine like this:
  oc get secret logging-fluentd --template='{{index .data "key"}}' | base64 -d > fluentd-key
  and use the local_fluentd_elasticsearch_client_key_path parameter in your ansible inventory
  or config file to pass in the file to use.

- `manage_services:` (default: `"true"`)

  If set to true, fluentd and collectd services will be enabled.

- `manage_packages:` (default: `"true"`)

  If set to true, all defined collectd and fluentd packages will be installed / updated to latest.


### Manage Services
This role manages collectd and fluentd services on the oVirt machines
It can start (default) / restart / reload / stop the services.

It can also enable / disable the services.


In order to run this role you will need to run:

     configure_ovirt_machines_for_metrics.sh --playbook=manage-ovirt-metrics-services.yml


You will need to set the following variables:

- `service_enabled:`  (default: `"yes"`)

  Set this to no if you don't what to enable the process

- `service_state:` (default: `"restarted"`)

  Set this to the required action. Optional values are: started, restarted, stopped reloaded.

- `service_name:` (default: `["collectd", "fluentd"`])

  A list of the the services that will be managed by the role.


In order to set these variable add the required variables to a file in
/etc/ovirt-engine-metrics/config.yml.d/ or in the command line.

License
-------

Apache License 2.0

