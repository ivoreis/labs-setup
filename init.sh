#/bin/bash
set -euo pipefail 

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
source "${CURRENT_DIR}/vars.sh"

echo "Setting up environment"
mkdir -p $AI_FOLDER

# Conda setup
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
$HOME/miniconda.sh -b -p $HOME/miniconda
chmod +x $HOME/miniconda.sh
eval "$($HOME/miniconda/bin/conda shell.bash hook)"
conda create -y -n $APP_NAME python=3.10
conda activate $APP_NAME

# Update deps
python -m pip install --upgrade pip

# Install Comfy
git clone https://github.com/comfyanonymous/ComfyUI.git $AI_FOLDER/$APP_NAME
cd $AI_FOLDER/$APP_NAME
pip install --no-input -r requirements.txt

# Update files
cp $CURRENT_DIR/extra_model_paths.yaml $AI_FOLDER/$APP_NAME/extra_model_paths.yaml

echo "Done"
