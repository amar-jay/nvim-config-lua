# Lua Neovim Config

A concise Neovim config in Lua. As well as configuration for multiple configs.

## TO USE

- Install packer [from this repo](https://github.com/wbthomason/packer.nvim)
- Install [lsp servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver) 

## Hot Keys

To know my hot keys. All has been packaged in the
[lua/common/keymap.lua](./lua/common/keymap.lua). 
Also all lsp language servers share the same hotkeys. 
Such as `gd` - to go to definition `K` - For hover. All these are in the keymap file
For effieciency and faster build time. No package manager is used.

# TLDR;

Currently there are two options; to change from `amarjay` to `kickstart`, do so in the [init.lua](./init.lua) and [after/plugin](./after/plugin/init.lua) files.

## TODO

- [x] Basic Setup
- [x] Treesitter
- [x] Lsp
    - [x] python
    - [x] golang
    - [x] rust
    - [x] Js/Ts
    - [x] JSX/React
    - [x] Svelte
    - [x] Astro
    - [x] Lua
    - [x] Grammarly
- [x] Telescope 
- [ ] Write script for setup
- [x] Set up linting
 - [x] Prettier
 - [x] golang
 - [x] rust
