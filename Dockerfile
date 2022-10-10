FROM ubuntu:jammy
# Fix as `apt-get update` is causing issues during build
USER root
RUN sed -i -e 's/^APT/# APT/' -e 's/^DPkg/# DPkg/' /etc/apt/apt.conf.d/docker-clean
RUN apt-get update
RUN apt-get install gettext-base -y

WORKDIR /factorio

COPY factorio .
COPY ./settings ./settings
COPY *.sh /factorio/
RUN chmod +x *.sh
#COPY current_game.zip /factorio/current_game.zip
