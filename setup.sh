# Neovim installation setup by app image
echo "Neovim installation"
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage \
./nvim.appimage --appimage-extract && ./squashfs-root/AppRun --version

## Optional: exposing nvim globally.
sudo mv squashfs-root / 
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim --version

# Installing Packer , a lua package manager
echo "Packer install"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# This contains tmux and neovim config files
echo "cloning amar-jay/.dotfiles"
git clone https://github.com/amar-jay/.dotfiles $HOME/.config

nvim
