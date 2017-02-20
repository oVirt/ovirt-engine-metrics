#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")"

. ../bin/config.sh
. "${ENGINE_DATA_BIN_DIR}"/engine-prolog.sh

CONFIG_FILE="${PKG_SYSCONF_DIR}/config.yml"

if [ -r "${CONFIG_FILE}" ]; then
	ansible-playbook \
		playbook.yml \
		-e @"${CONFIG_FILE}" \
		-e ansible_ssh_private_key_file="${ENGINE_PKI}/keys/engine_id_rsa" \
		-l ovirt_up_metrics_hosts
else
	# Do nothing for now
	:
fi
