#!/bin/sh
TARGET=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM

if [ -f /.dockerenv ]; then
    cat >> "$PREFIX/.messages.txt" <<EOF
To install the databases needed by LotuS3, execute:

cd "$TARGET/"
perl helpers/autoInstall.pl -condaDBinstall

EOF
else
    cd "$TARGET/"
    perl helpers/autoInstall.pl -condaDBinstall
fi

cat >> "$PREFIX/.messages.txt" <<EOF
Due to licence restrictions, if you would like to use usearch for OTU clustering
(uparse, unoise) and mapping, you need to download and install it from

http://www.drive5.com/usearch/download.html

and then execute:

lotus3 -link_usearch <path to usearch>

from within your lotus3 conda environment.
EOF
