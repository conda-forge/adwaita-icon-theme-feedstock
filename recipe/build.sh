#!/bin/bash

set -ex

meson setup builddir ${MESON_ARGS} --buildtype=release --prefix=$PREFIX || (cat builddir/meson-log/meson-log.txt; false)
# print full meson configuration
meson configure builddir

ninja -v -C builddir -j ${CPU_COUNT}
