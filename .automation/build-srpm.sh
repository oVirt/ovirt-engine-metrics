#!/bin/bash -xe

# git hash of current commit should be passed as the 1st paraameter
if [ "${GITHUB_SHA}" == "" ]; then
  GIT_HASH=$(git rev-list HEAD | wc -l)
else
  GIT_HASH=$(git rev-parse --short $GITHUB_SHA)
fi

SUFFIX=
# If MILESTONE is empty, it's an official release. Otherwise, add git hash
grep ^MILESTONE version.mak | grep -q 'MILESTONE=$' || SUFFIX=".git${GIT_HASH}"

# Directory, where build artifacts will be stored, should be passed as the 1st parameter
ARTIFACTS_DIR=${1:-exported-artifacts}

# Prepare rpmbuild directory
[[ -d rpmbuild ]] || mkdir -p rpmbuild

# Prepare source archive
make dist

# Build source package
rpmbuild \
    -D "_topdir rpmbuild" \
    -D "release_suffix ${SUFFIX}" \
    -ts ovirt-engine-metrics*.tar.gz
