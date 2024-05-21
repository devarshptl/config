#! /bin/bash

# Helpers
tool_exist() {
  cmd=$1
  cmd_types=("file" "function" "builtin")
  for cmd_type in "${cmd_types[@]}"; do
    if [[ "$(type -t "$cmd")" == "$cmd_type" ]]; then
      return 0
    fi
  done
  return 1
}

tool_install() {
  cmd=$1
  cmd_exec=$2
  if tool_exist "$cmd"; then
    echo "'$cmd' already installed."
  else
    echo "Installing '$cmd'..."
    eval "$cmd_exec"
    echo "'$cmd' installed successfully!"
  fi
}

# Brew: Install
tool_install brew '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# Brew: Configure Taps
brew_taps=("hashicorp/tap" "libkrun/krun")
for brew_tap in "${brew_taps[@]}"; do
  brew tap "$brew_tap"
  brew trust "$brew_tap"
done

# Brew: Install Packages (Formula & Casks)
### BREW_STORE_REPLACE_START ###
brew install awscli btop cmake fastfetch fd ffmpeg fish gleam go \
  imagemagick-full kind krunkit kubernetes-cli lazygit libpq neovim nvm openjdk \
  packer php podman podman-compose podman-tui poppler posting ripgrep rustup \
  sevenzip starship terraform yazi discord firefox flutter font-plemol-jp-nf \
  font-sauce-code-pro-nerd-font ghostty@tip logi-options+ miniconda proton-mail \
  proton-pass protonvpn rectangle whatsapp
### BREW_STORE_REPLACE_END ###

# Config: Clone
config_dir="$HOME/.config"
if [ -d "$config_dir" ]; then
  echo "Configuration already exists. Please delete it before re-executing this script, if required."
else
  echo "Cloning configuration..."
  git clone https://github.com/devarshptl/config.git ~/.config
  echo "Configuration cloned successfully!"
fi

# Shell: Default (fish)
if tool_exist "fish"; then
  fish_install_path=$(type -p "fish")
  if grep -q "$fish_install_path" /etc/shells; then
    echo "Fish alread exists in /etc/shells"
  else
    # Change shell to 'fish'
    echo "$fish_install_path" | sudo tee -a /etc/shells
    sudo chsh -s "$fish_install_path"
    sudo -k

    # OMF Install/Setup
    eval "$fish_install_path -c \"tool_install omf 'curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish'\""
    eval "$fish_install_path -c \"omf install\""
  fi
else
  echo "Fish shell not installed."
fi
