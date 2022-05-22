@echo OFF
echo Rebuilding Sources...

SET BASEPATH=%~dp0.
SET GAME_ROOT=%BASEPATH%/Stable

REM ---------------------

cd /D "%GAME_ROOT%/System"

echo Building engine and editor packages.
del engine.u
del editor.u
ucc make -nobind

cd /D "%GAME_ROOT%"

echo .
echo Rebuilding the code:
echo TODO: Check if CMake projects are working.
cmake -G "Visual Studio 17 2022" -DCMAKE_BUILD_TYPE=Debug ..

cd /D "%BASEPATH%"
echo .
call #REBUILD_USCRIPT.bat

REM ---------------------