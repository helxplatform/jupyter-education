FROM helxplatform/jupyter/datascience-notebook:v0.0.5

ARG CONDA_ENV=/opt/conda
ARG HOME_DIR=/home/jovyan

USER root

RUN apt-get update && \
    apt-get install -y vim openssh-client rsync

COPY comp116.py $HOME_DIR
COPY Fetcher.ipynb $HOME_DIR

COPY start-jupyter-edu.sh /usr/local/bin

RUN conda install --yes --prefix $CONDA_ENV -c conda-forge \
        ipython \
        ipywidgets

RUN conda install pip

RUN /opt/conda/bin/pip3 install python-otter otter-grader

USER $NB_USER

ENTRYPOINT start-jupyter-edu.sh 
