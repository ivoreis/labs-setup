#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
source "${CURRENT_DIR}/_vars.sh"

BASE_FOLDER="$EXAMPLES_PATH"
mkdir -p "$BASE_FOLDER"

echo "Start: Setup examples"
if [ ! -d "$BASE_FOLDER/ComfyUI_examples" ] 
then
    git clone https://github.com/comfyanonymous/ComfyUI_examples.git "$BASE_FOLDER/ComfyUI_examples"
fi

if [ ! -d "$BASE_FOLDER/Wyrde_examples" ] 
then
    git clone https://github.com/wyrde/wyrde-comfyui-workflows.git "$BASE_FOLDER/Wyrde_examples"
fi

if [ ! -d "$BASE_FOLDER/Wyrde_examples_2" ] 
then
    git clone https://github.com/atlasunified/Templates-ComfyUI-.git "$BASE_FOLDER/Wyrde_examples_2"
fi

echo "Done: Setup examples"
