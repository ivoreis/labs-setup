#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"

source "$CURRENT_DIR/setup_conda.sh"
source "$CURRENT_DIR/activate_conda.sh"
python -m pip install --upgrade pip
source "$CURRENT_DIR/setup_comfyui.sh"
source "$CURRENT_DIR/setup_examples.sh"
source "$CURRENT_DIR/setup_models.sh"
source "$CURRENT_DIR/setup_nodes.sh"
source"$CURRENT_DIR/run.sh"