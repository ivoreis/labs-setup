#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
source "${CURRENT_DIR}/activate_conda.sh"

python "$APP_PATH/main.py"
