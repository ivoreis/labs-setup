#/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
source "${CURRENT_DIR}/vars.sh"

python $AI_FOLDER/$APP_NAME/main.py
