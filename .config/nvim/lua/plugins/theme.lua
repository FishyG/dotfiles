local M = {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local monokai = require("monokai")
        monokai.setup {
            custom_hlgroups = {
                ["@markup.strong.markdown_inline"] = {
                    bold = true,
                    fg = "#ff00ff",
                    italic = true,
                    gui = "bold"
                },

            }
        }
       
        -- Load monokai's palette
        local palette = monokai.classic

        -- Set the background to none for that sweet transparency
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        
        -- For the sidebar on the left
        vim.o.cursorline = true
        vim.o.cursorlineopt = "number"
        vim.api.nvim_set_hl(0, "CursorLineNR", { bg = "none", fg = "#ffaaff", bold = true })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#806080" })
        
        -- Specific to markdown
        vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { bold = true })
        vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { italic = true })
        vim.api.nvim_set_hl(0, "@markup.strikethrough.markdown_inline", { strikethrough = true })
        vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = palette.pink })
        vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline", { bold = false, italic = true, underline = true, fg = palette.green })
        vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { underline = true, fg = palette.pink })
        vim.api.nvim_set_hl(0, "@markup.heading.markdown", { bold = true })
        vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { bold = true, fg = palette.orange })
        vim.api.nvim_set_hl(0, "@markup.heading.7.markdown", { bold = true, fg = palette.orange })
    end,
}

return M
