#/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
source "${CURRENT_DIR}/vars.sh"

echo "Activating conda ${APP_NAME} environment"
eval "$(conda shell.bash hook)"
conda activate $APP_NAME
conda info --envs
echo "Done"
