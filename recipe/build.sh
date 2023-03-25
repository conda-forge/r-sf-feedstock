#!/bin/bash
set -o errexit -o pipefail

# workarond conda-forge/r-base-feedstock#163
export PKG_CPPFLAGS="-DHAVE_WORKING_LOG1P"
# NB: unsure if this is even used...
export CPPFLAGS="${CPPFLAGS} -Wl,-rpath,${PREFIX}/lib"
# This is just to get around a configure failure when trying to link to gdal.	  ${R} CMD INSTALL --build .
if [[ ${target_platform} == osx-64 ]]; then
  export CXX="${CXX} --std=c++14 -Wl,-rpath,${PREFIX}/lib"
fi

export DISABLE_AUTOBREW=1
${R} CMD INSTALL --build . ${R_ARGS}
