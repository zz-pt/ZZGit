#!/bin/ksh

# Use env variable to pass on Qt location
export QT_PREFIX_LOC=$HOME/Qt5.2.0/5.2.0/gcc_64
# Get cmake
export PATH=~/zmake/cmake-2.8.12.1-Linux-i386/bin:$PATH

buildDir=$PWD/linux_release
if [ ! -d $buildDir ]; then
	mkdir $buildDir
fi

cd $buildDir
cmake -DCMAKE_BUILD_TYPE=Release ../

