#!/bin/bash
set -e
set -x

# Install GCC
# yum install -y gcc

# Add intel YUM repository
tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel® oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF
mv /tmp/oneAPI.repo /etc/yum.repos.d
rpm --import https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
yum-config-manager --enable oneAPI

INTEL_VERSION=2021.2.0
yum install -y intel-oneapi-compiler-fortran-runtime-${INTEL_VERSION}.x86_64
yum clean all

touch /etc/sgi-release
