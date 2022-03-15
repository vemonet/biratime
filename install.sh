#!/bin/bash

# Install oh-my-zsh, zshrc config and theme
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp zsh/.zshrc ~/.zshrc
cp zsh/vemonet_bira.zsh-theme ~/.oh-my-zsh/custom/themes/vemonet_bira.zsh-theme

# Add SSH completion
sudo cp zsh/_ssh_completion /usr/share/zsh/functions/Completion/Unix/_ssh

# Add SSH config
cp ssh_config ~/.ssh/config

# Use ZSH shell by default
sudo chsh --shell=/usr/bin/zsh $USER