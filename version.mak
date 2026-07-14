# Version Information

VERSION_MAJOR=1
VERSION_MINOR=6
VERSION_PATCH_LEVEL=4
VERSION=$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH_LEVEL)

# Milestone is manually specified,
# example for ordering:
# - master
# - alpha
# - master
# - beta
# - master
# - beta2
# - master
# - rc
# - master
# - rc2
# - master
# - <none>
#
MILESTONE=master
#MILESTONE=

# RPM release is manually specified or set via PACKAGE_RPM_RELEASE environment variable.
# For non-tagged (dev) builds, use default:
# RPM_RELEASE=0.master (with release_suffix appended via rpmbuild --define)
#
# For tagged (release) builds, PACKAGE_RPM_RELEASE is set by the CI/CD pipeline:
# RPM_RELEASE can be extracted from the tag (e.g., tag=v1.6.4-1 gives PACKAGE_RPM_RELEASE=1)
#
PACKAGE_RPM_RELEASE ?= 0.master
RPM_RELEASE=$(PACKAGE_RPM_RELEASE)
