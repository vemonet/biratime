#!/bin/sh

## Uses this script:
# sh -c "$(curl -fsSL https://raw.github.com/vemonet/biratime/main/install.sh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install custom theme and enable virtualenv plugin
curl -fsSL -o ~/.oh-my-zsh/custom/themes/biratime.zsh-theme https://raw.github.com/vemonet/biratime/main/biratime.zsh-theme
sed -i 's/^ZSH_THEME=".*"$/ZSH_THEME="biratime"/g' ~/.zshrc
sed -i 's/^plugins=(/plugins=(virtualenv /g' ~/.zshrc

# Install Solarized colors
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

# Hide the default conda env displayed to only show it with the ZSH theme
echo "\`conda config --set changeps1 false\`" >> ~/.oh-my-zsh/plugins/virtualenv/virtualenv.plugin.zsh

# Enable the ZSH shell by default
sudo chsh --shell=/usr/bin/zsh $USER

