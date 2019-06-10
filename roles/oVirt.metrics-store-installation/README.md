# oVirt.metrics-store-installation

This role creates a vm that is used to run the oVirt metrics store
installation and it generates the inventory, vars.yaml and playbook files
required for the installation and copies it to the vm.

## Running the role:

1. On the Manager machine, copy /etc/ovirt-engine-metrics/config.yml.example to config.yml:
```
# cp /etc/ovirt-engine-metrics/metrics-store-config.yml.example /etc/ovirt-engine-metrics/config.yml.d/metrics-store-config.yml
```
2. Update the values of /etc/ovirt-engine-metrics/metrics-store-config.yml to match the details of your specific environment:
```
# vi /etc/ovirt-engine-metrics/config.yml.d/metrics-store-config.yml
```

3. On the Manager machine, copy /etc/ovirt-engine-metrics/secure_vars.yaml.example to /etc/ovirt-engine-metrics/secure_vars.yaml:
```
# cp /etc/ovirt-engine-metrics/secure_vars.yaml.example /etc/ovirt-engine-metrics/secure_vars.yaml
```

4. Update the values of /etc/ovirt-engine-metrics/secure_vars.yaml to match the details of your specific environment:
```
# vi /etc/ovirt-engine-metrics/secure_vars.yaml
```

5. Encrypt secure_vars.yaml file
```
# ansible-vault encrypt /etc/ovirt-engine-metrics/secure_vars.yaml
```

6. Go to ovirt-engine-metrics repo:
```
# cd /usr/share/ovirt-engine-metrics
```

7. Run the metrics store installation playbook that creates the metrics store installer virtual machine
```
# ANSIBLE_JINJA2_EXTENSIONS="jinja2.ext.do" ./configure_ovirt_machines_for_metrics.sh \
  --playbook=ovirt-metrics-store-installation.yml --ask-vault-pass
```

8. Log into the admin portal and review the metrics store installer virtual machine creation.

9. Log into the metrics store installer virtual machine
```
# ssh root@<metrics-store-installer ip or fqdn>
```

10. Run the ansible playbook that deploys OpenShift on the created vms

```
# ANSIBLE_CONFIG="/usr/share/ansible/openshift-ansible/ansible.cfg" \
  ANSIBLE_ROLES_PATH="/usr/share/ansible/roles/:/usr/share/ansible/openshift-ansible/roles" \
  ansible-playbook -i integ.ini install_okd.yaml -e @vars.yaml -e @secure_vars.yaml --ask-vault-pass
```

## Variables for installing the oVirt metrics store

- `openshift_distribution:`
   The default for `oVirt` is `origin`.
   For `Red Hat Virtualization`, default is `openshift-enterprise`.
- `openshift_ansible_files_path:`(default: `/root`)
- `ovirt_elasticsearch_mounted_storage_path:`(default:`/var/lib`)
- `engine_url:`(Mandatory. No default )
- `engine_user:`(Mandatory. No default )
- `engine_password:`(Mandatory. No default )
- `engine_insecure:`(default: `false`)
- `engine_cafile:`(default: `/etc/pki/ovirt-engine/ca.pem`)
- `public_hosted_zone:`(No default )
- `create_host_entry:`(default: `false` )
- `root_password:`( No default )
- `openshift_logging_admin_password:`( No default )
- `ovirt_cluster_name:`(default: `Default`)
- `openshift_ovirt_storage_domain_name:`(default: `hosted_storage`)
- `openshift_ovirt_bastion_machine_name:`(default: `metrics-store-installer`)
- `openshift_ovirt_all_in_one:`(default: `true`)
- `number_of_openshift_master_vms:`(default: `1`)
- `number_of_openshift_node_vms:`(default: `0`)
- `number_of_openshift_etcd_vms:`(default: `0`)
- `number_of_openshift_lb_vms:`(default: `0`)
- `openshift_logging_es_cluster_size:`(default: 1)
- `openshift_logging_es_number_of_replicas:`(default: 0)
- `elasticsearch_disk_size:`(default: `500GiB`)
- `openshift_logging:` (default:`true`)
- `ovirt_template_name:` (default:`rhelguest76`)
- `ovirt_template_memory:` (default:`4GiB`)
- `ovirt_template_cpu:` (default:2)
- `ovirt_template_timeout:` (default:`1200`)
- `ovirt_template_disk_size:` (default:`100GiB`)
- `ovirt_template_nics: :` (default: `[ {name: nic1 , profile_name: ovirtmgmt, interface: virtio} ]`)
- `ovirt_metrics_store:` (default: `true`)

### Additional mandatory variables for Red Hat Virtualization:

- `qcow_url:`( No default )
- `rhsub_user:`( No default )
- `rhsub_pass:`( No default )
- `rhsub_pool:`( default: [] )
- `qcow_url:` ( No default )
- `rhsub_user:` ( No default )
- `rhsub_pass:` ( No default )
- `rhsub_pool:` ( No default )
- `oreg_auth_user:` ( No default )
- `oreg_auth_password:` ( No default )
