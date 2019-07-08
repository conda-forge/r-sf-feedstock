#!/bin/bash

export CPPFLAGS="${CPPFLAGS} -Wl,-rpath,${PREFIX}/lib"

# This is just to get around a configure failure when trying to link to gdal.
if [[ ${target_platform} == osx-64 ]]; then
  export CXX="${CXX} --std=c++11 -Wl,-rpath,${PREFIX}/lib"
fi

$R CMD INSTALL --build .
