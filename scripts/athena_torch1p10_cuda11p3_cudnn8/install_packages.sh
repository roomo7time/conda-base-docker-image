apt-get update
apt-get upgrade
pip uninstall -y torch
pip uninstall -y torchvision
pip uninstall -y torchaudio
pip uninstall -y torchelastic
pip install torch==1.10.0+cu111 torchvision==0.11.0+cu111 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html
pip install -r requirements.txt
