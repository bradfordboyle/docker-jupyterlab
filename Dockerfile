FROM ubuntu:18.04

VOLUME ["/srv/notebooks"]

COPY scripts /tmp/scripts

RUN /tmp/scripts/base.sh && \
    /tmp/scripts/julia.sh

CMD ["jupyter",  "lab", "--ip='0.0.0.0'", "--allow-root"]
