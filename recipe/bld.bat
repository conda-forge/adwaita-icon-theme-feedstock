@echo on

meson setup builddir --buildtype=release --prefix="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: print results of build configuration
meson configure builddir
if errorlevel 1 exit 1

ninja -v -C builddir -j %CPU_COUNT%
if errorlevel 1 exit 1
