# ⌚️ Biratime ZSH theme

A simple [oh-my-zsh](https://ohmyz.sh) theme based on the [Bira theme](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/bira.zsh-theme). The username has been replaced by the time in 24h format, as we usually don't need to be reminded on which machine and user we are logged in at every key stroke. But it can be helpful to keep track of time within the terminal.

The color of the time changes from blue to red if you are logged with a user that is not UID `1000`, as the user with UID `1000` is usually the 1st user to be created on the machine, and used as main user. This helps to quickly know when you are logged in with a special user, such as root.

## 🖼️ What it looks like

Here is what the theme looks like in a Gnome Terminal with the [solarized colors scheme](https://ethanschoonover.com/solarized) enabled.

If there are uncommited changes in the current git repository:

![screenshot commited](resources/screenshot_uncommited.png)

And if there are no changes to commit, but some local commits needs to be pushed to the remote git repository:

![screenshot commited](resources/screenshot_commited.png)

## 📥️ Installation

<details><summary>You will need to have ZSH and Oh My ZSH! installed.</summary>

Install the ZSH shell:

```bash
# On Debian-based Linux
sudo apt install -y zsh
# On RedHat Linux
sudo dnf install -y zsh
# On MacOS
brew install zsh
```

Install [Oh My ZSH!](https://ohmyz.sh)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

</details>

1. **Download the theme**:

```bash
curl -fsSL -o ~/.oh-my-zsh/custom/themes/biratime.zsh-theme https://raw.github.com/vemonet/biratime/main/biratime.zsh-theme
```

2. **Enable the theme** by setting `ZSH_THEME="biratime"` in your `~/.zshrc` config file:

```bash
sed -i 's/^ZSH_THEME=".*"$/ZSH_THEME="biratime"/g' ~/.zshrc
```

3. **Enable the [solarized colors scheme](https://ethanschoonover.com/solarized)** for your terminal

If you use Linux with the Gnome terminal:

```bash
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
```

If you use the Microsoft Terminal, you can enable solarized colors for the WSL terminal in the Settings window.

4. Use the **ZSH shell by default**:

```bash
sudo chsh --shell=/usr/bin/zsh $USER
```

## 🕊️ Contribute

Feel free to create issues, or proposes changes through pull requests.
