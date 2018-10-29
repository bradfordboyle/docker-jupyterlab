#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

curl -LO https://julialang.org/juliareleases.asc
gpg --import juliareleases.asc
curl -LO https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.1-linux-x86_64.tar.gz
curl -LO https://julialang-s3.julialang.org/bin/linux/x64/1.0/julia-1.0.1-linux-x86_64.tar.gz.asc
gpg --verify julia-1.0.1-linux-x86_64.tar.gz.asc julia-1.0.1-linux-x86_64.tar.gz
tar xzf julia-1.0.1-linux-x86_64.tar.gz -C /opt
/opt/julia-1.0.1/bin/julia "${DIR}/install.jl"
