FROM ubuntu:18.04

COPY install.jl /tmp

RUN apt-get update && \
    apt-get install -y curl gnupg python3-pip && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    pip3 install jupyterlab && \
    jupyter labextension install @jupyterlab/plotly-extension && \
    curl -LO https://julialang.org/juliareleases.asc && \
    gpg --import juliareleases.asc && \
    curl -LO https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.0-linux-x86_64.tar.gz && \
    curl -LO https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.0-linux-x86_64.tar.gz.asc && \
    gpg --verify julia-1.0.0-linux-x86_64.tar.gz.asc julia-1.0.0-linux-x86_64.tar.gz && \
    tar xzf julia-1.0.0-linux-x86_64.tar.gz -C /opt && \
    /opt/julia-1.0.0/bin/julia /tmp/install.jl

CMD ["jupyter",  "lab", "--ip='0.0.0.0'", "--allow-root"]
