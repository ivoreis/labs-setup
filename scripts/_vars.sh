#!/bin/bash
BASE="${BASE:="$HOME"}"

export APP_NAME="comfyui"
export CONDA_ENV="comfyui"

export AI_PATH="$BASE/ai"
export APP_PATH="$AI_PATH/$APP_NAME"
export MODELS_PATH="$AI_PATH/models"
export EXAMPLES_PATH="$AI_PATH/examples"
