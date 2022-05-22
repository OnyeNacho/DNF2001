@echo OFF
SET BASEPATH=%~dp0.
SET GAME_ROOT=%BASEPATH%/Stable

REM ---------------------

cd /D "%GAME_ROOT%/System"
echo .

if [%1]==[] (
	echo Rebuilding all .u packages...
	del *.u
	ucc make -nobind
	
	for %%f in (*.u) do (
		echo %%~nf
		ucc conform "%%~nf.u" "%BASEPATH%/Junk/conform_dummy.u"
	)
) else (
	echo Rebuilding specific .u packages:
	
	for %%x in (%*) do (
		echo %%~x
		del %%~x.u
	)
	
	ucc make -nobind
	
	for %%x in (%*) do (
		echo CONFORMING %%~x
		ucc conform %%~x.u "%BASEPATH%/Junk/conform_dummy.u"
	)
)

@pause

cd /D "%BASEPATH%"

REM ---------------------