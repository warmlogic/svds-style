#!/bin/bash

cd ~/Downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh -b

# Add to and source .bashrc
export PATH="$HOME/miniconda3/bin:$PATH"
# Clears history
hash -r

# Don't ask if you want to update
conda config --set always_yes yes

# -q for quiet
conda update -q conda

conda install -n root _license

# List info in case things don't work
conda info -a

# This adds the conda-forge channel below the defaults library
conda config --append channels conda-forge

packages='jupyter
notebook
ipywidgets
jupyter_contrib_nbextensions
pyparsing
matplotlib
mkl
seaborn
pip
pandas
scikit-learn
scipy
numpy
statsmodels
tqdm'

# # removed:
# mpld3

# # Only including r in py3 because conda install r and py2 don't work.
# # If you need it, force
# conda create -q --name py3 --channel r r r-irkernel r-recommended r-essentials rpy2 python=3 $packages -y

conda create -q --name py3 python=3 $packages -y
source activate py3

# additional packages
pip install missingno
# pip install mplsvds

# Install the matplotlib style library
# https://github.com/ipython/ipython/issues/8873#issuecomment-146185652
# ipython kernel install --display-name py3 --name py3

python -m ipykernel install --user --name py3 --display-name "py3"
source deactivate

conda create -q --name py2 python=2 $packages -y
source activate py2

# additional packages
pip install missingno
# pip install mplsvds

# Install the matplotlib style library
# https://github.com/ipython/ipython/issues/8873#issuecomment-146185652
# ipython kernel install --display-name py2 --name py2

python -m ipykernel install --user --name py2 --display-name "py2"
source deactivate
