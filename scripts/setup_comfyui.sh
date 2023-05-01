#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
TEMPLATES_PATH="$CURRENT_DIR/../templates"

source "${CURRENT_DIR}/_vars.sh"
source "${CURRENT_DIR}/activate_conda.sh"

echo "Start: Setting up ComfyUI"

if [ ! -d "$APP_PATH" ] 
then
    git clone https://github.com/comfyanonymous/ComfyUI.git "$APP_PATH"
    cd "$APP_PATH" &&\
        pip install --upgrade --force-reinstall --no-input -r requirements.txt
fi

# Update templates
cp "$TEMPLATES_PATH/extra_model_paths.yaml" "$APP_PATH/extra_model_paths.yaml"

echo "Done: Setting up ComfyUI"