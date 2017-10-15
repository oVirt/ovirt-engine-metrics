## Fluentd/Client

This role configures a Fluentd secure_forward client to send to a remote
fluentd server.

Metrics and logs have different defaults and different parameters,
since the data behavior is different.

The available variables for this role are:

- `fluentd_fluentd_host:`  (default: `"localhost"`)

  Address of the fluentd server host.

- `fluentd_keepalive:` (default: `"300"`)

  The duration for keepalive. If this parameter is not specified, keepalive is disabled.

The following configurations specify how the buffer plugins should buffer events.
Events are gathered to chunks by the output plugins.

### Metrics buffer configurations

- `fluentd_buffer_chunk_limit_metrics:` (default: `"1m"`)

   The size of each chunk. The suffixes “k” (KB), “m” (MB), and “g” (GB) can be used.

- `fluentd_flush_interval_metrics:` (default: `"10s"`)

  The interval between data flushes. The default is 10s.
  The suffixes “s” (seconds), “m” (minutes), and “h” (hours) can be used.

- `fluentd_buffer_queue_limit_metrics:` (default: `"8"`)

  The length of the chunk queue.

- `fluentd_buffer_queue_full_action_metrics:` (default: `"drop_oldest_chunk"`)

  Control the buffer behaviour when the queue becomes full. 3 modes are supported: exception, block, drop_oldest_chunk.
  For a full documentation about `buffer_queue_full_action` parameter, please refer to fluentd documentation.

- `fluentd_retry_wait_metrics:` (default: `"1s"`)

  The initial interval between write retries. The default value is 1.0 seconds.
  The interval doubles (with +/-12.5% randomness) every retry until max_retry_wait is reached.

- `fluentd_retry_limit_metrics:` (default: `"17"`)

  The limit on the number of retries before buffered data is discarded. The default value is 17.
  If the limit is reached, buffered data is discarded and the retry interval is reset to its initial value
  (fluentd_retry_wait_metrics).

- `fluentd_disable_retry_limit_metrics:` (default: `"false"`)

  If true, the value of retry_limit is ignored and there is no limit.

- `fluentd_max_retry_wait_metrics:` (default: `"300s"`)

  The maximum interval between write retries.

- `fluentd_flush_at_shutdown_metrics:` (default: `"true"`)

  If set to true, Fluentd waits for the buffer to flush at shutdown.
  By default, it is set to true for Memory Buffer and false for File Buffer.

- `fluentd_num_threads_metrics:` (default: `"1"`)

  The number of threads to flush the buffer.
  This option can be used to parallelize writes into the output(s) designated by the output plugin.
  Increasing the number of threads improves the flush throughput to hide write / network latency. The default is 1.

- `fluentd_slow_flush_log_threshold_metrics:` (default: `"20.0"`)

  The threshold for checking chunk flush performance. The default value is 20.0 seconds.
  Note that parameter type is float, not time.


### Logs buffer configurations

- `fluentd_buffer_chunk_limit_logs:` (default: `"4m"`)

  The size of each chunk. The suffixes “k” (KB), “m” (MB), and “g” (GB) can be used.

- `fluentd_flush_interval_logs:` (default: `"10s"`)

  The interval between data flushes. The default is 10s.
  The suffixes “s” (seconds), “m” (minutes), and “h” (hours) can be used.

- `fluentd_buffer_queue_limit_logs:` (default: `"8"`)

  The length of the chunk queue.

- `fluentd_buffer_queue_full_action_logs:` (default: `"exception"`)

  Control the buffer behaviour when the queue becomes full. 3 modes are supported: exception, block, drop_oldest_chunk.
  For a full documentation about `buffer_queue_full_action` parameter, please refer to fluentd documentation.

- `fluentd_retry_wait_logs:` (default: `"1s"`)

  The initial interval between write retries. The default value is 1.0 seconds.
  The interval doubles (with +/-12.5% randomness) every retry until max_retry_wait is reached.

- `fluentd_retry_limit_logs:` (default: `"17"`)

  The limit on the number of retries before buffered data is discarded. The default value is 17.
  If the limit is reached, buffered data is discarded and the retry interval is reset to its initial value
  (fluentd_retry_wait_logs).

- `fluentd_disable_retry_limit_logs:` (default: `"true"`)

  If true, the value of retry_limit is ignored and there is no limit.

- `fluentd_max_retry_wait_logs:` (default: `"300s"`)

  The maximum interval between write retries.

- `fluentd_flush_at_shutdown_logs:` (default: `"true"`)

  If set to true, Fluentd waits for the buffer to flush at shutdown.
  By default, it is set to true for Memory Buffer and false for File Buffer.

- `fluentd_num_threads_logs:` (default: `"1"`)

  The number of threads to flush the buffer.
  This option can be used to parallelize writes into the output(s) designated by the output plugin.
  Increasing the number of threads improves the flush throughput to hide write / network latency. The default is 1.

- `fluentd_slow_flush_log_threshold_logs:` (default: `"20.0"`)

  The threshold for checking chunk flush performance. The default value is 20.0 seconds.
  Note that parameter type is float, not time.


In order to set these variable add the required variables to the config.yml
or in the command line.

For example, if you want to update the `fluentd_keepalive` to 500,
you would need to run the Ovirt metrics configuration script like this:

::


    configure_ovirt_machines_for_metrics.sh -e "fluentd_keepalive=500"


or add the following line to the config.yml file and run configure_ovirt_machines_for_metrics.sh

::

    fluentd_keepalive: 500

You don't need to update the configuration file if you wish to use default options.
