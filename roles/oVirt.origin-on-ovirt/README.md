# oVirt.origin-on-ovirt

**Note:** This README is relevant for installing OpenShift as part of the oVirt
ansible roles. For installing oVirt Metrics store, please follow the REAME under the
`oVirt.metrics-store-installation` role.

This role creates a vms for the OpenShift origin
installation and it generates the inventory, vars.yaml and playbook files
required for the installation and copies it to the vm.

## Running the role:

1. Go to origin-on-ovirt repo:
```
# cd  /usr/share/ansible/roles/oVirt.origin-on-ovirt
```

2. Copy playbook_vars.yml.example as playbook_vars.yml:
```
# cp playbook_vars.yml.example playbook_vars.yml
```
3. Update the values of playbook_vars.yml to match the details of your specific environment:
```
# vi playbook_vars.yml
```

4. On the Manager machine, copy secure_vars.yaml.example to secure_vars.yaml:
```
# cp secure_vars.yaml.example secure_vars.yaml
```

5. Update the values of playbook_vars.yml to match the details of your specific environment:
```
# vi secure_vars.yaml
```

6. Encrypt secure_vars.yaml file
```
# ansible-vault encrypt secure_vars.yaml
```

7. Run the installation playbook that creates the OpenShift virtual machines and OpenShift installer virtual machine:
```
# ANSIBLE_JINJA2_EXTENSIONS="jinja2.ext.do" ansible-playbook playbooks/origin_on_ovirt.yml \
  -e @playbook_vars.yml -e @secure_vars.yaml --ask-vault-pass
```

8. Log into the admin portal and review the installer virtual machine creation.

9. Log into the installer virtual machine
```
# ssh root@<openshift-ovirt-bastion ip or fqdn>
```

10. Run the ansible plabook that deploys OpenShift on the created vms

```
# ANSIBLE_CONFIG="/usr/share/ansible/openshift-ansible/ansible.cfg" \
  ANSIBLE_ROLES_PATH="/usr/share/ansible/roles/:/usr/share/ansible/openshift-ansible/roles" \
  ansible-playbook -i integ.ini install_okd.yaml -e @vars.yaml -e @secure_vars.yaml --ask-vault-pass
```

## Variables for installing OpenShift origin on oVirt

- `openshift_distribution:`
   The default for `oVirt` is `origin`.
   In Red Hat Virtualization an additional file named: 10-rhv_vars.yml
   is added to /etc/ovirt-engine-metrics/config.yml.d/
   and overwrite the variable to `openshift-enterprise`.
   For `Red Hat Virtualization`, default is `openshift-enterprise`.
- `openshift_ansible_files_path:`(default: `/root`)
- `openshift_ansible_files_path:`(default: `/root`)
- `ovirt_elasticsearch_mounted_storage_path:`(default:`/var/lib`)
- `engine_url:`(Mandatory. No default )
- `engine_user:`(Mandatory. No default )`
- `engine_password:`(Mandatory. No default)
- `engine_insecure:`(default: `false`)
- `engine_cafile:`(default: `/etc/pki/ovirt-engine/ca.pem`)
- `engine_ssh_public_key_file_path:`(No default)
- `public_hosted_zone:`(No default )
- `create_host_entry:`(default: `false`)
- `root_password:`( No default )
- `ovirt_cluster_name:`(default: `Default`)
- `openshift_ovirt_storage_domain_name:`(default: `hosted_storage`)
- `openshift_ovirt_bastion_machine_name:`(default: `openshift-ovirt-bastion`)
- `openshift_ovirt_all_in_one:`(default: `true`)
- `number_of_openshift_master_vms:`(default: `1`)
- `number_of_openshift_node_vms:`(default: `0`)
- `number_of_openshift_etcd_vms:`(default: `0`)
- `number_of_openshift_lb_vms:`(default: `0`)
- `ovirt_template_name:` (default:`rhelguest76`)
- `ovirt_template_memory:` (default:`4GiB`)
- `ovirt_template_cpu:` (default:2)
- `ovirt_template_timeout:` (default:`1200`)
- `ovirt_template_disk_size:` (default:`100GiB`)
- `ovirt_template_nics: :` (default: `[ {name: nic1 , profile_name: ovirtmgmt, interface: virtio} ]`)

## OpenShift Logging related variables

- `openshift_logging:` (default:`true`)
- `openshift_logging_admin_password:`( No default )
- `openshift_logging_es_cluster_size:`(default: 1)
- `openshift_logging_es_number_of_replicas:`(default: 0)
- `elasticsearch_disk_size:`(default: `500GiB`)

## oVirt metrics store related variable
- `ovirt_metrics_store:` (default: `false`)

### Additional mandatory variables for Red Hat Virtualization:
### Please be sure to secure these variables, either by vault or deleting them after installation.

- `rhsub_user:`( No default )
- `rhsub_pass:`( No default )
- `rhsub_pool:`( default: [] )
- `qcow_url:` ( No default )
- `rhsub_user:` ( No default )
- `rhsub_pass:` ( No default )
- `rhsub_pool:` ( No default )
- `oreg_auth_user:` ( No default )
- `oreg_auth_password:` ( No default )
