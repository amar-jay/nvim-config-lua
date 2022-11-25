# Lua Neovim Config

A concise Neovim config in Lua

## TO USE

- Install packer [from this repo](https://github.com/wbthomason/packer.nvim)
- Install [lsp servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver) 

## Hot Keys

To know my hot keys. All has been packaged in the
[lua/amarjay/keymap.lua](./lua/amarjay/keymap.lua). 
Also all lsp language servers share the same hotkeys. 
Such as `gd` - to go to definition `K` - For hover. All these are in the keymap file
For effieciency and faster build time. No package manager is used.

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
