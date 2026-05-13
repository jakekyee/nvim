local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================
-- Telescope (SAFE LAZY LOAD)
-- =========================
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end)








-- =========================
-- File explorer
-- =========================
-- map("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })

-- =========================
-- Terminal
-- =========================
-- map("n", "<leader>tt", ":ToggleTerm<CR>", { silent = true })

-- =========================
-- SSHFS
-- =========================

-- =========================
-- Ctrl key GUI behavior
-- =========================

-- Ctrl + C (copy to system clipboard via OSC52)
map("n", "<C-c>", "yy", opts)
map("x", "<C-c>", "y", opts)
map("s", "<C-c>", "y", opts)
map("i", "<C-c>", "<Esc>yy", opts)

-- Ctrl + X
map("n", "<C-x>", '"+dd', opts)
map("i", "<C-x>", '+x', opts)


-- Ctrl + V (paste)
map("n", "<C-v>", '"+p', opts)
map("i", "<C-v>", '<C-r>+', opts)
map("v", "<C-v>", '+p', opts)

-- Ctrl + A (select all)

map("n", "<C-a>", "ggVG", opts)
map("i", "<C-a>", "<Esc>ggVG", opts)
map("x", "<C-a>", "<Esc>ggVG", opts)


map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
map("x", "<C-s>", "<Esc>:w<CR>a", opts)



map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-g>u<Esc>ui", opts)
map("x", "<C-z>", "<Esc>u", opts)



map("n", "<C-y>", "<C-r>", opts)
map("i", "<C-y>", "<Esc><C-r>i", opts)
map("x", "<C-y>", "<Esc><C-r>", opts)





map("n", "<C-p>", function()
  require("telescope.builtin").find_files()
end)

map("n", "<C-f>", function()
  require("telescope.builtin").live_grep()
end)


map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")


map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")


vim.keymap.set({ "n", "i", "v" }, "<C-b>", function()
  vim.schedule(function()
    vim.cmd("Neotree toggle")
  end)
end, { silent = true })

map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")


map("n", "<leader>ss", ":RemoteSSHFSConnect<CR>")
map("n", "<leader>sd", ":RemoteSSHFSDisconnect<CR>")
map("n", "<leader>aa", ":RemoteSSHFSConnect<CR>")



--map("n", "<S-h>", function() require("winbuf").cycle(-1) end, { silent = true })
map("n", "<leader>tt>", function() require("winbuf").cycle(1) end, { silent = true })

--map("n", "[b", function() require("winbuf").cycle(-1) end, { silent = true })
--map("n", "]b", function() require("winbuf").cycle(1) end, { silent = true })


map("n", "<leader>tl", function() require("winbuf").move_buf("h") end, { silent = true })
map("n", "<leader>th", function() require("winbuf").move_buf("l") end, { silent = true })
--map("n", "<A-j>", function() require("winbuf").move_buf("j") end, { silent = true })
--map("n", "<A-k>", function() require("winbuf").move_buf("k") end, { silent = true })


map("n", "<C-w>", function() require("winbuf").close_buf() end, { silent = true })
--map("n", "<C-S-w>", function() require("winbuf").close_split() end, { silent = true })
--
--
map("n", "<C-r>", "<C-w>w", { silent = true })
