local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = ({
          ensure_installed = {
		  "arduino",
		  "bash",
		  "c",
		  "cpp",
		  "diff",
		  "git_config",
		  "git_rebase",
		  "gitattributes",
		  "gitcommit",
		  "gitignore",
		  "html",
		  "javascript",
		  "json",
		  "kconfig",
		  "latex",
		  "lua",
          "markdown",
          "markdown_inline",
		  "python",
		  "ssh_config",
		  "toml",
		  "vim",
		  "vimdoc",
		  "xml",
		  "yaml"},
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        }),
        
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
}

return { M }

