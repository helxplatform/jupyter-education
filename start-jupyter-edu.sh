#!/bin/bash

HOME_PATH="/home/jovyan"
USER_PATH="/home/${USER_NAME}"

# Start the notebook
cd ${HOME_PATH}
start-notebook.sh --NotebookApp.token= --ip="*" --NotebookApp.base_url=${NB_PREFIX} --NotebookApp.allow_origin="*"

