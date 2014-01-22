set dir=%CD%\build_VS2012_x64

if exist %dir% goto make
mkdir build_vs2012_x64

:make
cd build_vs2012_x64
cmake -G "Visual Studio 11 Win64" ../

cd ..

pause