local M = {
    "VonHeikemen/lsp-zero.nvim",
    event = "BufReadPre",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
    },
    config = function(_, _)
        local keymap = vim.keymap
        local lsp = require("lsp-zero")

        local border = {
            "⁕",
            "─",
            "⁕",
            "│",
            "⁕",
            "─",
            "⁕",
            "│",
        }

        lsp.preset("recommended")
        lsp.set_preferences({
            sign_icons = {},
        })

        function on_attach(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover,
                {
                    border = border,
                }
            )
            vim.lsp.handlers["textDocument/signature_help"] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                {
                    border = border,
                }
            )

            keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            keymap.set("n", "<leader>vd", function()
                vim.diagnostic.open_float()
            end, opts)
            keymap.set("n", "<leader>va", function()
                vim.lsp.buf.code_action()
            end, opts)
            keymap.set("n", "<leader>vr", function()
                vim.lsp.buf.references()
            end, opts)
            keymap.set("i", "<C-h>", function()
                vim.lsp.buf.signature_help()
            end, opts)
            keymap.set("n", "<C-F>", "<cmd>LspZeroFormat<CR>")
        end

        lsp.on_attach(on_attach)

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                "rust_analyzer",    -- For rust (William bruh)
                "clangd",   -- For clangd
                "bashls",   -- For bash
                "pyright"  -- For python
            },
            handlers = {
                lsp.default_setup,
            },
        })

        lsp.setup()
    end,
}


return M
