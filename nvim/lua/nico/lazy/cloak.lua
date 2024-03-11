return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            -- the applied highlight group, see :h highlight
            highlight_group = "Comment",
            patterns = {
                {
                    -- match any file starting with ".env"
                    -- this can be a table to match multiple patterns
                    file_pattern = {
                        ".env",
                        "wrangler.toml",
                        ".dev.vars",
                    },
                    -- match an equals sign and any char after it
                    -- this can also be a table of patterns to cloak
                    -- example: cloak_pattern = {":.+", "-.+"} for yaml files.
                    cloak_pattern = "=.+"
                },
            },
        })
    end
}
