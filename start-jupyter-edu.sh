#!/bin/bash

HOME_PATH="/home/jovyan"
USER_PATH="/home/${USER_NAME}"

# Create directory and move files.
function move() {
    WORK_PATH=$1
    echo ${WORK_PATH}
    mkdir ${WORK_PATH}
    cd ${WORK_PATH}
    mv "${HOME_PATH}/src/Fetcher.ipynb" .
    mv "${HOME_PATH}/src/comp116.py" .
}

# Create a soft link
function make_soft_link() {
    ln -s ${USER_PATH} ${HOME_PATH}
}

if [ -d "$USER_PATH" ]; then
    COMP116_PATH=${USER_PATH}/COMP116
    move $COMP116_PATH
    make_soft_link
else
    COMP116_PATH=${HOME_PATH}/COMP116
    move $COMP116_PATH
fi

# Start the notebook
cd ${HOME_PATH}
start-notebook.sh --NotebookApp.token= --ip="*" --NotebookApp.base_url=${NB_PREFIX} --NotebookApp.allow_origin="*"

