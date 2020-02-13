
# Autocompletion for argo, the workflow engine for Kubernetes
#
# Author: https://github.com/vemonet

if [ $commands[argo] ]; then
  source <(argo completion zsh)
fi
