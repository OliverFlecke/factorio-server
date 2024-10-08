# Currently has to run on amd64 builds (no Apple Silicon)
FROM ubuntu:24.04
USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    gettext-base \
    wget \
    tar \
    xz-utils \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /

ARG VERSION=stable
# Download and extract headless factorio server
RUN wget --progress=dot:giga https://factorio.com/get-download/$VERSION/headless/linux64 \
  && tar -xf linux64 \
  && rm linux64

WORKDIR /factorio
COPY ./settings ./settings
COPY *.sh /factorio/
RUN chmod +x ./*.sh

USER guest
