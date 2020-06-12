REM Build hdf5-lz4

set PPATH="usr/local/hdf5/lib/plugin"

mkdir %PREFIX%\%PPATH%

set CXXLAGS="%CFLAGS%"
set CPPFLAGS="-I%PREFIX%/include"
set LDFLAGS="-L%PREFIX%/lib"

make -e HDF5_INSTALL="%PREFIX%"
copy lib* %PREFIX%\%PPATH%

setlocal EnableDelayedExpansion

REM Copy the [de]activate scripts to %PREFIX%\etc\conda\[de]activate.d.
for %%F in (activate deactivate) DO (
    if not exist %PREFIX%\etc\conda\%%F.d mkdir %PREFIX%\etc\conda\%%F.d
    copy %RECIPE_DIR%\%%F.bat %PREFIX%\etc\conda\%%F.d\plugin_path.bat
)
