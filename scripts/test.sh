#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname "$0")"
source "$CURRENT_DIR/_vars.sh"
source "$CURRENT_DIR/activate_conda.sh"

echo $APP_NAME