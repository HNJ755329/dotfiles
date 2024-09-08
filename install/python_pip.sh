#!/usr/bin/env bash

if ! type python3 >/dev/null 2>&1; then sudo apt-get install -y python3; fi
if ! type python3-venv >/dev/null 2>&1;then sudo apt-get install -y python3-venv;fi

if type python3 >/dev/null 2>&1; then
python3 -m venv $HOME/venv/base
source $HOME/venv/base/bin/activate

pip3 install -y -q \
tdqm \
kaggle \
online-judge-tools \
numpy \
qiskit
fi


