# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="lr-snes9x"
PKG_VERSION="4432700"
PKG_SHA256="0211ac201966b4b0332786e95995a7cd6ea640ccd5d02af142e3e98e621c4ed9"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/snes9x"
PKG_URL="https://github.com/libretro/snes9x/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_LONGDESC="Snes9x - Portable Super Nintendo Entertainment System (TM) emulator "
PKG_TOOLCHAIN="manual"

PKG_LIBNAME="snes9x_libretro.so"
PKG_LIBPATH="libretro/$PKG_LIBNAME"

make_target() {
  make -C libretro GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
    mkdir -p $INSTALL/usr/lib/libretro
    cp $PKG_LIBPATH $INSTALL/usr/lib/libretro/
}
