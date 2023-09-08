@ECHO off
IF %1.==. (GOTO No1) ELSE (SET repo=%1 && SET gitrepo=%1)
IF %2.==. (SET branch=master) ELSE (SET branch=%2)
IF %3.==. (SET owner=${DEFAULT_GITHUB_USER}) ELSE (SET owner=%3)

FOR /f %%i IN ('git ls-remote https://github.com/%owner%/%gitrepo%.git %branch%')DO SET "_remote=%%~i"
PUSHD ${BASE_DIR}\%repo%
FOR /f %%i IN ('git rev-parse %branch%')DO SET "_local=%%~i"
IF %_remote%==%_local% (ECHO 1) ELSE (ECHO 0)

GOTO End

:No1
	ECHO No repo specified
	GOTO End

:End
	POPD
