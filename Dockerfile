FROM jupyter/datascience-notebook

ARG CONDA_ENV=/opt/conda
ARG HOME_DIR=/home/jovyan

USER root

RUN apt-get update && \
    apt-get install -y vim openssh-client rsync

COPY comp116.py $HOME_DIR
COPY Fetcher.ipynb $HOME_DIR

COPY start-jupyter-edu.sh /usr/local/bin

USER $NB_USER

RUN conda install --yes --prefix $CONDA_ENV -c conda-forge \
        ipython \
        ipywidgets

ENTRYPOINT start-jupyter-edu.sh 
