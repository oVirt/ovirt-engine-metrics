#!/bin/sh

script="$(readlink -f "$0")"
scriptdir="$(dirname "${script}")"

"${scriptdir}"/configure_ovirt_machines_for_metrics.sh --scope=hosts
