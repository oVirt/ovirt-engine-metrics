## ovirt_dashboards_examples

This role places sample dashboards and visualizations on the engine machine,
by default at /etc/ovirt-engine-metrics/dashboards-examples.

Dashboard examples include `System Dashboard`, `Hosts Dashboard`, `VMs Dashboard`, `Processes Dashboard`.

For now, these visualization and dashboards need to be manually imported from the Kibana UI.

1. Copy the /etc/ovirt-engine-metrics/dashboards-examples directory to your local machine.

2. Go to the Kibana UI, to the `setting` -> `objects`.

3. Import the `Searches`.

4. Import the `Visualizations`.

5. Import the `Dashboards`.

6. Go to the `Dashboard` tab in the Kibana UI and choose a dashboard.

