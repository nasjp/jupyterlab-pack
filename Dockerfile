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
    python-language-server[all]

RUN jupyter labextension install \
    @lckr/jupyterlab_variableinspector \
    @krassowski/jupyterlab-lsp \
    @axlair/jupyterlab_vim

RUN jupyter lab build

COPY . /app
COPY ./jupyter_config /root/.jupyter

WORKDIR /app

CMD jupyter lab

EXPOSE 10000
