#!/bin/bash
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2
make -j $SHED_NUMJOBS
make html
make "DESTDIR=$SHED_FAKEROOT" install
make "DESTDIR=$SHED_FAKEROOT" install-html
