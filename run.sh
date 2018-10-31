#!/usr/bin/env bash

docker run \
    --publish 8888:8888 \
    --volume ~/workspace:/workspace \
    jupyterlab
