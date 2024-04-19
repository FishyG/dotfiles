local M = {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
        options = {
            theme = "molokai",
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "buffers" },
            lualine_c = { "branch", "diff", "diagnostics" },
            lualine_x = { "encoding", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end
}

return M
