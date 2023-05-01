#!/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname -- "$( readlink -f -- "$0"; )")"
source "${CURRENT_DIR}/_vars.sh"

WGET_OPS="-q --show-progress --content-disposition"
BASE_FOLDER="$MODELS_PATH"

DIFFUSION_MODELS="diffusion_models"
UPSCALE_MODELS="upscale_models"
CONTROL_NET_MODELS="control_net_models"
VAES_MODELS="vaes"
LORAS_MODELS="loras"
TEXTUAL_INVERSION_EMBEDDINGS="textual_inversion_embeddings"
DIFFUSER_MODELS="diffusers"
GLIGEN_MODELS="gligen_models"

echo "Start: Setup base folders"
mkdir -p "$BASE_FOLDER/$DIFFUSION_MODELS"
mkdir -p "$BASE_FOLDER/$UPSCALE_MODELS"
mkdir -p "$BASE_FOLDER/$CONTROL_NET_MODELS"
mkdir -p "$BASE_FOLDER/$VAES_MODELS"
mkdir -p "$BASE_FOLDER/$LORAS_MODELS"
mkdir -p "$BASE_FOLDER/$TEXTUAL_INVERSION_EMBEDDINGS"
mkdir -p "$BASE_FOLDER/$DIFFUSER_MODELS"
mkdir -p "$BASE_FOLDER/$GLIGEN_MODELS"
echo "Done: Setup base folders"

echo "Start: Setup diffusion models"
DIFFUSION=(
 "https://civitai.com/api/download/models/51426" #Colorful
 "https://civitai.com/api/download/models/5581" #Anything 4.5
 "https://civitai.com/api/download/models/15236" #Deliberate 2 
 "https://civitai.com/api/download/models/27392" #OpenJourney
 "https://civitai.com/api/download/models/29460" #Realistic Vision 2
 "https://civitai.com/api/download/models/11925" #Never Ending Dream
 "https://civitai.com/api/download/models/46846" #Rev Animated
)
for diffusion in "${DIFFUSION[@]}"; do
    wget "${diffusion}" "${WGET_OPS}" -P "$BASE_FOLDER/$DIFFUSION_MODELS"
done
# wget "https://huggingface.co/stabilityai/stable-diffusion-2-1-unclip/resolve/main/sd21-unclip-h.ckpt" ${WGET_OPS} -O "$BASE_FOLDER/$DIFFUSION_MODELS/sd21-unclip-h.ckpt"
echo "Done: Setup diffusion models"

echo "Start: Setup loras"
echo "Done: Setup loras"

echo "Start: Setup upscale models"
UPSCALE=(
    "RealESRGAN_x2"
    "RealESRGAN_x4"
    "RealESRGAN_x8"
)
for upscale in "${UPSCALE[@]}"; do
    wget "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/${upscale}.pth" "${WGET_OPS}" -O "$BASE_FOLDER/$UPSCALE_MODELS/${upscale}.pth"
done
echo "Done: Setup upscale models"

echo "Start: Setup control net models"
CONTROL_NET=(
    "control_v11e_sd15_ip2p"
    "control_v11e_sd15_shuffle"
    "control_v11f1e_sd15_tile"
    "control_v11f1p_sd15_depth"
    "control_v11p_sd15_canny"
    "control_v11p_sd15_inpaint"
    "control_v11p_sd15_lineart"
    "control_v11p_sd15_mlsd"
    "control_v11p_sd15_normalbae"
    "control_v11p_sd15_scribble"
    "control_v11p_sd15_seg"
    "control_v11p_sd15_softedge"
    "control_v11p_sd15s2_lineart_anime"
)
for control_net in "${CONTROL_NET[@]}"; do
wget "https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/${control_net}.pth" "${WGET_OPS}" -O "$BASE_FOLDER/$CONTROL_NET_MODELS/${control_net}.pth"
done
echo "Done: Setup control net models"

echo "Start: Setup VAE"
wget "https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors" "${WGET_OPS}" -O "$BASE_FOLDER/$VAES_MODELS/vae-ft-mse-840000-ema-pruned.safetensors"
echo "Done: Setup VAE"

echo "Start: Setup GLIGEN"
wget "https://huggingface.co/comfyanonymous/GLIGEN_pruned_safetensors/resolve/main/gligen_sd14_textbox_pruned.safetensors" "${WGET_OPS}" -O "$BASE_FOLDER/$GLIGEN_MODELS/vgligen_sd14_textbox_pruned.safetensors"
echo "Done: Setup GLIGEN"
