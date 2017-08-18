#!/bin/bash

PKG_DIR="pkg"

echo "-- Clean $PKG_DIR ..."
if [ -d "$PKG_DIR" ]; then
    echo "-- Removing $PKG_DIR ..."
    rm -rf $PKG_DIR
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

echo "-- Extract libapr ..."
dpkg-deb -x libapr1_1.5.2-3_armhf.deb $PKG_DIR
dpkg-deb -x libapr1-dev_1.5.2-3_armhf.deb $PKG_DIR

echo "-- Extract libaprutil ..."
dpkg-deb -x libaprutil1_1.5.4-1build1_armhf.deb $PKG_DIR
dpkg-deb -x libaprutil1-dev_1.5.4-1build1_armhf.deb $PKG_DIR

echo "-- Extract liblog4cxx ..."
dpkg-deb -x liblog4cxx10v5_0.10.0-10ubuntu1_armhf.deb $PKG_DIR
dpkg-deb -x liblog4cxx10-dev_0.10.0-10ubuntu1_armhf.deb $PKG_DIR

echo "-- Extract libplist ..."
dpkg-deb -x libplist3_1.12-3.1_armhf.deb $PKG_DIR
dpkg-deb -x libplist-dev_1.12-3.1_armhf.deb $PKG_DIR

echo "-- Extract libusbmuxd ..."
dpkg-deb -x libusbmuxd4_1.0.10-2ubuntu0.1_armhf.deb $PKG_DIR
dpkg-deb -x libusbmuxd-dev_1.0.10-2ubuntu0.1_armhf.deb $PKG_DIR

echo "-- Extract libxml2 ..."
dpkg-deb -x libxml2_2.9.3+dfsg1-1ubuntu0.2_armhf.deb $PKG_DIR
dpkg-deb -x libxml2-dev_2.9.3+dfsg1-1ubuntu0.2_armhf.deb $PKG_DIR

echo "-- Extract zlib1g ..."
dpkg-deb -x zlib1g_1%3a1.2.8.dfsg-2ubuntu4.1_armhf.deb $PKG_DIR
dpkg-deb -x zlib1g-dev_1%3a1.2.8.dfsg-2ubuntu4.1_armhf.deb $PKG_DIR

echo "-- Do some work ..."
mv $PKG_DIR/usr/include/arm-linux-gnueabihf/openssl/opensslconf.h $PKG_DIR/usr/include/openssl/
rm -rf $PKG_DIR/usr/include/arm-linux-gnueabihf
mv $PKG_DIR/usr/lib/arm-linux-gnueabihf/* $PKG_DIR/usr/lib
rm -rf $PKG_DIR/usr/lib/arm-linux-gnueabihf

echo "-- Install to system ..."
sudo cp -rf $PKG_DIR/lib/* /lib
sudo cp -rf $PKG_DIR/usr/* /usr/arm-linux-gnueabihf

echo "-- Done."
