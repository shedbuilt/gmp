#!/bin/bash
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2
make -j $SHED_NUM_JOBS
make html
make "DESTDIR=$SHED_FAKE_ROOT" install
make "DESTDIR=$SHED_FAKE_ROOT" install-html
