FROM jupyter/datascience-notebook:python-3.9.5

ARG CONDA_ENV=/opt/conda
ARG HOME_DIR=/home/jovyan

USER root

RUN apt-get update && \
    apt-get install -y vim openssh-client rsync && \
    apt-get install -y pkg-config libxml2-dev libxmlsec1-dev libxmlsec1-openssl

COPY src/ $HOME_DIR/src/
COPY saml/ $HOME_DIR/saml/

COPY start-jupyter-edu.sh /usr/local/bin

USER $NB_USER

RUN conda install --yes --prefix $CONDA_ENV -c conda-forge \
        ipython \
        ipywidgets

RUN conda install pip

RUN /opt/conda/bin/pip3 install python-otter otter-grader python3-saml

ENTRYPOINT start-jupyter-edu.sh 
