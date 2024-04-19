@echo on

meson setup builddir --buildtype=release --prefix="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: print results of build configuration
meson configure builddir
if errorlevel 1 exit 1

meson install -C builddir
if errorlevel 1 exit 1
