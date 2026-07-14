#!/bin/bash -xe

TMPREPOS=${TMPREPOS:-tmp.repos}

# Install build dependencies
dnf builddep -y $TMPREPOS/SRPMS/*src.rpm

# Build binary package
rpmbuild \
    --define "_topdir $(pwd)/$TMPREPOS" \
    --define "_rpmdir $(pwd)/$TMPREPOS" \
    --define "release_suffix ${RELEASE_SUFFIX:-}" \
    --rebuild $TMPREPOS/SRPMS/*src.rpm
