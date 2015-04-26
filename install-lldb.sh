#!/bin/sh
GIT=/usr/local/bin/git
CMAKE=/usr/local/bin/cmake
NINJA=/usr/local/bin/ninja
PYTHON_PATH=/usr/local/include/python2.7

$GIT clone http://llvm.org/git/llvm.git
cd llvm/tools
$GIT clone http://llvm.org/git/clang.git
$GIT  clone http://llvm.org/git/lldb.git
cd ..
mkdir build
cd build

$CMAKE ../ -G Ninja -DCMAKE_CXX_FLAGS="-std=c++11 -stdlib=libc++ -I$PYTHON_PATH -g"
$NINJA lldb
#$NINJA check-lldb # if you want to run tests

su <<EOSU
$NINJA lldb install
EOSU
