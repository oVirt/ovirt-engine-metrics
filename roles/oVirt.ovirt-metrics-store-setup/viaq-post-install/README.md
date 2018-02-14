## oVirt.metrics-store-setup/viaq-post-install

This role creates files that contain the metrics and logs indexes UUIDs,
the certificates and creates an admin user on the metrics store machine.

The role also updates the curator configmap for the oVirt metrics index.

The available variables for this role are:
- `curator_configmap_file_path:`(default: `/root/ovir_metrics_curator_configmap.yaml`)

   Path to copy curator configmap to, on the metrics store machine.

- `ovirt_metrics_curator_delete_days:`(default: `3`)

   oVirt metrics indexes older than the number of days stated here will be deleted.

