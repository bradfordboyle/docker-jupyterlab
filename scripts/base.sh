#!/usr/bin/env bash

apt-get update
apt-get install -y \
	curl \
	gnupg \
	python3-pip

curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt-get install -y \
	nodejs

pip3 install jupyterlab
jupyter labextension install @jupyterlab/plotly-extension
