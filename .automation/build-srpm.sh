#!/bin/bash -xe

# Prepare rpmbuild directory
TMPREPOS=${TMPREPOS:-tmp.repos}
[[ -d "$TMPREPOS" ]] || mkdir -p "$TMPREPOS"/{SPECS,RPMS,SRPMS,SOURCES}

# Prepare source archive
make dist

# Build source package
rpmbuild \
    --define "_topdir $(pwd)/$TMPREPOS" \
    --define "release_suffix ${RELEASE_SUFFIX:-}" \
    -ts ovirt-engine-metrics*.tar.gz
