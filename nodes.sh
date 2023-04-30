#/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
source "${CURRENT_DIR}/vars.sh"

BASE_FOLDER="$AI_FOLDER/$APP_NAME/custom_nodes"

mkdir -p "$BASE_FOLDER"

echo "Setup custom nodes"
git clone "https://github.com/Fannovel16/comfy_controlnet_preprocessors.git" $BASE_FOLDER/comfy_controlnet_preprocessors && \ 
    cd $BASE_FOLDER/comfy_controlnet_preprocessors && \
    mv requirements.txt requirements.txt.bkp && cat requirements.txt.bkp | sed 's/mediapipe==0.9.1.0/mediapipe==0.9.3.0/' > requirements.txt && \
    pip install -r requirements.txt && \
    python install.py

git clone "https://github.com/Davemane42/ComfyUI_Dave_CustomNode.git" $BASE_FOLDER/ComfyUI_Dave_CustomNode

git clone "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git" $BASE_FOLDER/ComfyUI-Impact-Pack && \
    cd $BASE_FOLDER/ComfyUI-Impact-Pack && \
    pip install -r requirements.txt && \
    python install.py

git clone "https://github.com/LucianoCirino/efficiency-nodes-comfyui.git" $BASE_FOLDER/efficiency-nodes-comfyui

git clone "https://github.com/WASasquatch/was-node-suite-comfyui.git" $BASE_FOLDER/was-node-suite-comfyui && \
    cd $BASE_FOLDER/was-node-suite-comfyui && \
    pip install -r requirements.txt

# git clone "https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92.git" $BASE_FOLDER/QualityOfLifeSuit_Omar92

echo "Done"
