#!/bin/bash
# download-source.sh downloads source files from the yum repository provided by Oracle.
# Yum repository is listed in https://dev.mysql.com/downloads/repo/yum/.

set -euo pipefail

ROOT=$(git rev-parse --show-toplevel)

rm -rf "$ROOT/rpmbuild-orig"
mkdir -p "$ROOT/rpmbuild-orig"

docker run \
  --rm \
  -v "$ROOT/rpmbuild-orig":/rpmbuild \
  almalinux:10 bash -c "cd /root && dnf install -y https://dev.mysql.com/get/mysql97-community-release-el10-1.noarch.rpm && dnf download --source mysql-community-server && rpm -ivh *.src.rpm && cp -r rpmbuild/* /rpmbuild"
