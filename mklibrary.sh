#!/bin/bash

PKG_DIR="pkg"

echo "-- Clean $PKG_DIR ..."
if [ -d "$PKG_DIR" ]; then
    rm -f $PKG_DIR
fi
mkdir $PKG_DIR

echo "-- Extract libbluetooth ..."
dpkg-deb -x  libbluetooth3_*-*_armhf.deb $PKG_DIR
dpkg-deb -x  libbluetooth-dev_*-*_armhf.deb $PKG_DIR

echo "-- Extract libssl ..."
dpkg-deb -x libssl1.0.0_*-*_armhf.deb $PKG_DIR
dpkg-deb -x libssl-dev_*-*_armhf.deb $PKG_DIR

echo "-- Extract libsqlite3 ..."
dpkg-deb -x libsqlite3-0_*-*_armhf.deb $PKG_DIR
dpkg-deb -x libsqlite3-dev_*-*_armhf.deb $PKG_DIR

echo "-- Extract libudev ..."
dpkg-deb -x libudev1_*-*_armhf.deb $PKG_DIR
dpkg-deb -x libudev-dev_*-*_armhf.deb $PKG_DIR

echo "-- Done."
