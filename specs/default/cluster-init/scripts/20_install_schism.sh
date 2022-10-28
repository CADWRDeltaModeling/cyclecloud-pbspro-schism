#!/bin/bash

set -x
set -e

SCHISM_TAR=schism.5.8_intel2021.2.tar.gz

jetpack download $SCHISM_TAR /tmp/

cd /
tar -xzf /tmp/$SCHISM_TAR

cat <<EOF > /etc/profile.d/schism.sh
#!/bin/bash
source /opt/intel/oneapi/setvars.sh intel64
export PATH=/opt/schism/5.8.0:\$PATH
EOF
chmod 755 /etc/profile.d/schism.sh

