#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
source "${CURRENT_DIR}/_vars.sh"

echo "Start: Activating conda ${CONDA_ENV} environment"
eval "$(conda shell.bash hook)"
conda activate "$CONDA_ENV"
echo "Done: Activating conda ${CONDA_ENV} environment"
