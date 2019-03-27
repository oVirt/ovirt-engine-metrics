#!/bin/bash -xe

# remove any previous artifacts
rm -rf output
rm -f ./*tar.gz
make clean

make dist

. automation/set_release_suffix.sh

# create the src.rpm
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

[[ -d exported-artifacts ]] || mkdir -p exported-artifacts
find output -iname \*rpm -exec mv "{}" exported-artifacts/ \;
mv *.tar.gz exported-artifacts
