#!/bin/bash

# This is just to get around a configure failure when trying to link to gdal.
if [[ ${target_platform} == osx-64 ]]; then
  export CXX="${CXX} --std=c++14 -Wl,-rpath,${PREFIX}/lib"
  export CPPFLAGS="${CPPFLAGS} -Wl,-rpath,§{PREFIX}/lib"
elif [[ ${target_platform} =~ .*linux.* ]]; then
  # This is to keep configure happy when it compiles a test proj4 project. Urgh.
  export CPPFLAGS="${CPPFLAGS} -Wl,-rpath,${PREFIX}/lib"
fi
export PROJ_LIB=${PREFIX}/share/proj
$R CMD INSTALL --build .
