@ECHO off
:Loop
	ECHO Checking for updates...
	SET total=0
	CALL:Check Repo1 master JackMBurch
	CALL:Check Repo2 development
	CALL:Check Repo3
	CALL:Check Repo4
	CALL:Check Repo5
	CALL:Check Repo6
	IF NOT %total%==6 GOTO Update
	GOTO Loop
	
:Check
	FOR /f %%i IN ('git-detect-update %1 %2 %3')DO SET /a "total=total+%%~i" && IF %%~i==1 (ECHO %1 up to date.) ELSE (ECHO %1 out of date!)
	EXIT /B 0
	
:Update
	ECHO Updating...
	timeout /t 30 /nobreak > NUL
	CD /d ${DEPLOY_DIR}
	ECHO %cd%
	START "" deploy.bat
	GOTO Exit
	
:Exit
	exit 0
	
:Error
	exit 1
