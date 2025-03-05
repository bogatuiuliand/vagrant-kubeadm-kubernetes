#!/bin/bash
#
# Create custom aliases

# Ensure package lists are updated before installing
sudo apt-get update

# Install bash-completion
sudo apt-get install -y bash-completion

# Ensure this script runs as the vagrant user to modify the correct .bashrc
sudo -i -u vagrant bash << 'EOF'
whoami
kubectl completion bash >> ~/.bashrc
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'alias k=kubectl' >> ~/.bashrc
echo 'complete -o default -F __start_kubectl k' >> ~/.bashrc
source ~/.bashrc
EOF