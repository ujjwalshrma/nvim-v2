local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.root_has_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js" })
      end,
    }),
  },
  on_attach = function(client, bufnr)
    local lsp_formatting = function()
      vim.lsp.buf.format({
        async = true,
        filter = function(c)
          return c.name == "null-ls" or c.name == client.name
        end,
      })
    end

    -- Keymap for formatting using lsp_formatting function defined inside on_attach
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "", {
      noremap = true,
      silent = true,
      callback = function()
        lsp_formatting()
      end
    })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        lsp_formatting()
      end,
    })
  end,
})

