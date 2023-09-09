# Windows Git Monitor
Use these batch scripts to automatically detect changes to repositories and trigger a deployment script upon detection.

You will have to have git installed (obviously) and add the folder containing git-detect-update.bat to path.

Supports specific branches. You will have to replace environment variables in the script (variables surrounded with ${}).

git-detect-update-service is what you will have running in the background on the host machine.

deploy.bat & windows-deploy.bat are examples of a possible deployment method using docker.
