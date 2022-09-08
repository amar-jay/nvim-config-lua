local status, prettier = pcall(require, "prettier")

if (not status) then
  print("Prettier import error!!")
  return end


prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "markdown",
    "graphql",
    "less"
  }
}

local status, mason = pcall(require, "mason")
if (not status) then return end

mason.setup({

})

