@ECHO off
@RD /S /Q "${DEPLOYMENT_DIR}"
xcopy /s ${NETWORK_DIR}\docker-compose.yml ${DEPLOYMENT_DIR}\docker-compose.yml*
xcopy /s ${NETWORK_DIR}\windows-deploy.bat ${DEPLOYMENT_DIR}\windows-deploy.bat*
START /d "{DEPLOYMENT_DIR}" windows-deploy.bat ${PARAM1} ${PARAM2}
EXIT 0
