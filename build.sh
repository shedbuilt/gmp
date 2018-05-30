#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
# Configure
SHED_PKG_LOCAL_DOCDIR="/usr/share/doc/${SHED_PKG_NAME}-${SHED_PKG_VESION}"
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=${SHED_PKG_LOCAL_DOCDIR} &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
# Install Docs
if [ -n "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    make html &&
    make DESTDIR="$SHED_FAKE_ROOT" install-html || exit 1
else
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_LOCAL_DOCDIR}"
fi
