return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,           -- auto-add closing tag
        enable_rename = true,          -- update opposite tag when one is edited
        enable_close_on_slash = false, -- close on </
      },
    },
  },
}
