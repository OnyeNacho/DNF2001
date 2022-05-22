#!/bin/bash
clear
echo "Rebuilding engine and editor classes:"
cd system
rm -f engine.u
rm -f editor.u
wine ucc make -nobind
cd ..

echo .
echo "Rebuilding the code:"
echo "TODO: Check if CMake projects are working."
mkdir build
cd build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug ..

echo .
echo Rebuilding the scripts:
cd system
rm -f *.u
wine ucc make -nobind
cd ..

echo
echo Done.