#!/bin/sh
wget https://factorio.com/get-download/stable/headless/linux64
tar -xvf linux64
useradd factorio
chown -R factorio:factorio factorio
rm linux64
