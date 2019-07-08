#!/bin/bash
echo $PKG_CONFIG_PATH
echo ${PREFIX}
export CPPFLAGS="${CPPFLAGS} -Wl,-rpath,${PREFIX}/lib"
export PKG_CPPFLAGS="-I${PREFIX}/include -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H=1"
export PKG_LIBS="-L$PREFIX/lib"
export PROJ_LIB="${PREFIX}/proj"
# This is just to get around a configure failure when trying to link to gdal.
if [[ ${target_platform} == osx-64 ]]; then
  export CXX="${CXX} --std=c++14 -Wl,-rpath,${PREFIX}/lib"
fi

$R CMD INSTALL --build .
