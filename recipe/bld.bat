@echo on

meson setup builddir --buildtype=release --prefix="%LIBRARY_PREFIX%"
if errorlevel 1 exit 1

:: print results of build configuration
meson configure builddir
if errorlevel 1 exit 1

meson install -C builddir
if errorlevel 1 exit 1

:: build icon cache manually since it fails for some reason when run by meson
"%BUILD_PREFIX%\Library\bin\gtk-update-icon-cache.exe" -f -t -q "%LIBRARY_PREFIX%\share\icons\Adwaita"
if errorlevel 1 exit 1
