# Currently has to run on amd64 builds (no Apple Silicon)
FROM --platform=linux/amd64 ubuntu:jammy
USER root
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean
RUN apt-get update
RUN apt-get install gettext-base wget tar xz-utils -y

WORKDIR /

ARG VERSION=stable
# Download and extract headless factorio server
RUN wget https://factorio.com/get-download/$VERSION/headless/linux64
RUN tar -xf linux64 && rm linux64

WORKDIR /factorio
COPY ./settings ./settings
COPY *.sh /factorio/
RUN chmod +x *.sh
