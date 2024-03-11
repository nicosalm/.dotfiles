return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            -- list of parser names, or "all"
            ensure_installed = { "vimdoc", "javascript", "typescript", "c",
                "lua", "rust", "jsdoc", "zig",
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
            },
            highlight = {
                enable = true,
            },
        })
    end
}
