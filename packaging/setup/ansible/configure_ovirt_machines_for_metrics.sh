#!/bin/sh

usage() {
	cat << __EOF__
Usage: $0 --scope=SCOPE
        SCOPE is one of 'hosts', 'engine', 'all'
__EOF__
	exit 1
}

cd "$(dirname "$(readlink -f "$0")")"

. ../bin/config.sh
. "${ENGINE_DATA_BIN_DIR}"/engine-prolog.sh

CONFIG_FILE="${PKG_SYSCONF_DIR}/config.yml"

SCOPE=all

while [ -n "$1" ]; do
	x="$1"
	v="${x#*=}"
	shift
	case "${x}" in
		--scope=*)
			SCOPE="${v}"
		;;
		--help)
			usage
		;;
		*)
			die "Invalid option '${x}'"
		;;
	esac
done

if [ -r "${CONFIG_FILE}" ]; then
	ansible-playbook \
		playbook.yml \
		-e @"${CONFIG_FILE}" \
		-e ansible_ssh_private_key_file="${ENGINE_PKI}/keys/engine_id_rsa" \
		-l "${SCOPE}"
else
	# Do nothing for now
	:
fi
