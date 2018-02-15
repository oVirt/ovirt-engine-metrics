## oVirt.ovirt-initial-validations/ovirt-include-vars-files

This role includes the config.yml file, if it exists and
also includes the `config.yml.d` directory,
where additional var files can be added.

The available variables for this role are:
- `ovirt_metrics_pkg_sysconf_dir:`(default: `/etc/ovirt-engine-metrics`)

  The ovirt-engine-metrics configuration information directory path

- `ovirt_metrics_config_yml_dir:`(default: `"{{ ovirt_metrics_pkg_sysconf_dir }}/config.yml.d"`)

  The path to the `config.yml.d` directory, where additional var files can be added.

- `ovirt_metrics_config_yml_file:`(default: `"{{ ovirt_metrics_pkg_sysconf_dir }}/config.yml"`)

  The ovirt-engine-metrics config.yml file path.
