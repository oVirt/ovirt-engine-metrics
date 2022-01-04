# This isn't a script, but a snippet - should be sourced by other scripts

release_suffix=
# If MILESTONE is empty, it's an official release. Otherwise, add git hash
grep ^MILESTONE version.mak | grep -q 'MILESTONE=$' || release_suffix=".git$(git rev-parse --short HEAD)"
