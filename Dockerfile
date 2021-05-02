FROM python:3.9

RUN pip install --upgrade pip

RUN curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs

RUN pip install \
    jupyterlab \
    pandas \
    sklearn \
    imbalanced-learn \
    lxml \
    html5lib \
    beautifulsoup4 \
    matplotlib \
    torch \
    scipy \
    cython \
    tqdm \
    jupyter-lsp \
    jupyterthemes \
    lightgbm \
    selenium \
    cached_property \
    optuna \
    python-language-server[all] \
    apache-beam[gcp]

RUN jupyter labextension install \
    @krassowski/jupyterlab-lsp \
    @axlair/jupyterlab_vim

RUN jupyter lab build

COPY . /app
COPY ./jupyter_config /root/.jupyter

WORKDIR /app

CMD jupyter lab

EXPOSE 10000
