#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
source "${CURRENT_DIR}/_vars.sh"

# Conda setup
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
chmod +x "$HOME/miniconda.sh"
"$HOME/miniconda.sh" -b -p "$HOME/miniconda"
eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda create -y -n "$CONDA_ENV" python=3.10
conda activate "$CONDA_ENV"