#!/bin/sh

script="$(readlink -f "$0")"
scriptdir="$(dirname "${script}")"

. "${scriptdir}"/config.sh
. "${ENGINE_DATA_BIN_DIR}"/engine-prolog.sh

PG_PASS="${COLLECTD_PGPASS}"

COLLECTD_PGPASS_DIR="$(dirname ${COLLECTD_PGPASS})"
mkdir -p "${COLLECTD_PGPASS_DIR}" || die "Failed to create ${COLLECTD_PGPASS_DIR}"
chmod 700 "${COLLECTD_PGPASS_DIR}" || die "Failed to chmod 700 ${COLLECTD_PGPASS_DIR}"

PASSWORD="$(sed 's;\(["\$]\);\\\1;g' << __EOF__
${ENGINE_DB_PASSWORD}
__EOF__
)"

cat > "${PG_PASS}" << __EOF__
${ENGINE_DB_HOST}:${ENGINE_DB_PORT}:${ENGINE_DB_DATABASE}:${ENGINE_DB_USER}:${PASSWORD}
__EOF__

chmod 600 "${PG_PASS}" || die "Failed to chmod 600 ${PG_PASS}"

if selinuxenabled; then
	semanage fcontext -a -t collectd_var_lib_t "${COLLECTD_PGPASS_DIR}(/.*)?'"
	restorecon -rv "${COLLECTD_PGPASS_DIR}"
fi
