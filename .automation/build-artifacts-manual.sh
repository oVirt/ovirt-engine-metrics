#!/bin/bash -xe

# remove any previous artifacts
rm -rf output
make clean

make dist

. automation/set_release_suffix.sh

# create the src.rpm, assuming the tarball is in the project's directory
rpmbuild \
    -D "_srcrpmdir $PWD/output" \
    -D "_topmdir $PWD/rpmbuild" \
    ${release_suffix:+-D "release_suffix ${release_suffix}"} \
    -ts ./*.gz

# install any build requirements
yum-builddep output/*src.rpm

# create the rpms
rpmbuild \
    -D "_rpmdir $PWD/output" \
    -D "_topmdir $PWD/rpmbuild" \
    ${release_suffix:+-D "release_suffix ${release_suffix}"} \
    --rebuild output/*.src.rpm

# Store any relevant artifacts in exported-artifacts for the ci system to
# archive
[[ -d exported-artifacts ]] || mkdir -p exported-artifacts
find output -iname \*rpm -exec mv "{}" exported-artifacts/ \;
mv ./*tar.gz exported-artifacts/
