# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 0riginally created by Escalade (https://github.com/escalade)
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-parallel-n64"
PKG_VERSION="6dadf0e71a6a07829d11451dfe6202fa8cb7e0a6"
PKG_SHA256="4ec624d78b5961f74f01abc6cc230beb36d0fbe5d523286aee16395ac55379a9"
PKG_ARCH="x86_64"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="https://github.com/libretro/parallel-n64/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."

PKG_LIBNAME="parallel_n64_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"

pre_build_target() {
  export GIT_VERSION=${PKG_VERSION:0:7}
}

make_target() {
  if [ -z "$DEVICE" ]; then
    PKG_DEVICE_NAME=$PROJECT
  else
    PKG_DEVICE_NAME=$DEVICE
  fi

  case $PKG_DEVICE_NAME in
    RPi|RPi2)
      make platform=${PKG_DEVICE_NAME,,}
      ;;
    Generic)
      make WITH_DYNAREC=$ARCH
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}