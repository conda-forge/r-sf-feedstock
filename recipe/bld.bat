sed -i -e "s/void R_init_sf/__declspec(dllexport) void R_init_sf/" src/RcppExports.cpp

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1
