#!/usr/bin/env sh
python -m venv $HOME/venv/base
source $HOME/venv/base/bin/activate

pip3 install -y -q \
tdqm \
kaggle \
online-judge-tools \
numpy \
qiskit


