FROM jupyter/datascience-notebook:python-3.9.5

ARG CONDA_ENV=/opt/conda
ARG HOME_DIR=/home/jovyan

USER root

RUN apt-get update && \
    apt-get install -y vim openssh-client rsync && \
    apt-get install -y pkg-config libxml2-dev libxmlsec1-dev libxmlsec1-openssl

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.2.0 python3 -
# This is necessary because by default Poetry creates a virtual environment, which we don't want in production
RUN $HOME_DIR/.local/bin/poetry config virtualenvs.create false

COPY src/ $HOME_DIR/src/
COPY saml/ $HOME_DIR/saml/
COPY pyproject.toml poetry.lock $HOME_DIR
COPY start-jupyter-edu.sh /usr/local/bin

RUN $HOME_DIR/.local/bin/poetry install --no-interaction --no-ansi --no-root

USER $NB_USER

RUN conda install --yes --prefix $CONDA_ENV -c conda-forge \
        ipython \
        ipywidgets

ENTRYPOINT start-jupyter-edu.sh 
