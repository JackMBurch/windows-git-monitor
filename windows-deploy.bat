@ECHO off
SETLOCAL
FOR /f "delims=[] tokens=2" %%a IN ('ping -4 -n 1 %ComputerName% ^| findstr [') DO SET IP=%%a
ECHO Network IP: %IP%
SET CURRENT_IP=%IP%
SET "${ENV_VAR1}=${DEFAULT_WEBSITE_ADDRESS}"
IF %1.==. (SET /p "${ENV_VAR1}=Enter web address or press [ENTER] for default [%${ENV_VAR1}%]: ") ELSE (SET ${ENV_VAR1}=%1)
IF %2.==. (SET /p "domainpass=Enter domain admin password: ") ELSE (SET domainpass=%2)
docker stop ${IMG1}-1
docker stop ${IMG2}-1
docker stop ${IMG3}-1
docker rm ${IMG1}
docker rm ${IMG2}
docker rm ${IMG3}
docker rmi ${IMG1}
docker rmi ${IMG2}
docker rmi ${IMG3}
docker volume rm ${VOLUME_NAME}
docker volume create --driver local --opt type=cifs --opt device=${NETWORK_DRIVE_PATH} --opt o=addr=${NETWORK_PATH},username=${USERNAME},password=%domainpass% ${VOLUME_NAME}
git clone https://${GITHUB_USER}@github.com/${GITHUB_USER}/${REPO1}.git ${REPO1}
xcopy /h ${SECRETS_FILE} "${REPO1}\secrets.json*"
git clone -b development https://${GITHUB_USER}@github.com/${GITHUB_ORG}/${REPO2}.git ${REPO2}
git clone https://${GITHUB_USER}@github.com/${GITHUB_ORG}/${REPO3}.git ${REPO3}
git clone https://${GITHUB_USER}@github.com/${GITHUB_ORG}/${REPO4}.git ${REPO4}
git clone https://${GITHUB_USER}@github.com/${GITHUB_ORG}/${REPO5}.git ${REPO5}
git clone https://${GITHUB_USER}@github.com/${GITHUB_USER}/${REPO6}.git ${REPO6}
PUSHD ${NETWORK_DIR}
START "" git-detect-update-service.bat
POPD
docker-compose up
