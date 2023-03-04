# Neovim installation setup by app image
echo "Neovim installation"
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage 
chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root / &&
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim &&
nvim --version

# Installing Packer , a lua package manager
echo "Packer install"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "cloning amar-jay/nvim-config-lua"
# This contains tmux and neovim config files
mkdir -p $HOME/.config;
mkdir -p $HOME/.config/nvim;

git clone https://github.com/amar-jay/nvim-config-lua $HOME/.config/.tmp
mv $HOME/.config/.tmp/* $HOME/.config/nvim/ &&
mv $HOME/.config/.tmp/.* $HOME/.config/nvim/ &&
rmdir $HOME/.tmp 

git clone https://github.com/github/copilot.vim.git $HOME/AppData/Local/nvim/pack/github/start/copilot.vim

nvim
