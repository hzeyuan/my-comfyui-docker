#!/usr/bin/env bash
set -e

# Clone the repo
git clone https://github.com/comfyanonymous/ComfyUI.git /ComfyUI
cd /ComfyUI
# git checkout ${COMFYUI_VERSION}

# Create and activate the venv
python3 -m venv --system-site-packages venv
source venv/bin/activate

# Install torch, xformers and sageattention
pip3 install --no-cache-dir torch=="${TORCH_VERSION}" torchvision torchaudio --index-url ${INDEX_URL}
pip3 install --no-cache-dir xformers=="${XFORMERS_VERSION}" --index-url ${INDEX_URL}

# Install requirements
pip3 install -r requirements.txt
pip3 install accelerate
pip3 install sageattention
pip install setuptools --upgrade

# Install ComfyUI Custom Nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager
cd custom_nodes/ComfyUI-Manager
pip3 install -r requirements.txt

deactivate
