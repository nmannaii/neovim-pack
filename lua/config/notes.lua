local M = {}

local notes_dir = vim.fn.expand("~/notes")

local function path(subdir, file)
  return string.format("%s/%s/%s", notes_dir, subdir, file)
end

local function ensure_dirs()
  local dirs = { "inbox", "daily", "projects", "permanent" }
  for _, d in ipairs(dirs) do
    local p = notes_dir .. "/" .. d
    if vim.fn.isdirectory(p) == 0 then
      vim.fn.mkdir(p, "p")
    end
  end
end

-- New note
function M.new()
  vim.ui.input({ prompt = "Title: " }, function(input)
    local name = os.date("%Y%m%d%H%M")
    if input and input ~= "" then
      input = input:gsub(" ", "-"):gsub("[^a-zA-Z0-9-]", ""):lower()
      name = name .. "-" .. input
    end
    vim.cmd("edit " .. path("inbox", name .. ".md"))
  end)
end

-- Daily note
function M.daily()
  local file = os.date("%Y-%m-%d") .. ".md"
  vim.cmd("edit " .. path("daily", file))
end

-- Find notes (Telescope)
function M.find()
  Snacks.picker.files({
    cwd = notes_dir,
    prompt = "Notes",
  })
end

-- Search notes (content)
function M.search()
  Snacks.picker.grep({
    cwd = notes_dir,
    prompt_title = "Search Notes",
  })
end

-- Insert [[link]]
function M.link()
  vim.ui.input({ prompt = "Link: " }, function(input)
    if input and input ~= "" then
      vim.api.nvim_put({ "[[" .. input .. "]]" }, "c", true, true)
    end
  end)
end

-- Move note
function M.move()
  local targets = { "inbox", "projects", "permanent" }

  vim.ui.select(targets, { prompt = "Move to:" }, function(choice)
    if not choice then return end

    local current = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(current, ":t")
    local new_path = path(choice, filename)

    vim.cmd("write")
    os.rename(current, new_path)
    vim.cmd("edit " .. new_path)
  end)
end

function M.setup()
  ensure_dirs()

  local map = vim.keymap.set

  map("n", "<leader>nn", M.new, { desc = "New note" })
  map("n", "<leader>nd", M.daily, { desc = "Daily note" })
  map("n", "<leader>nf", M.find, { desc = "Find notes" })
  map("n", "<leader>ns", M.search, { desc = "Search notes" })
  map("n", "<leader>nl", M.link, { desc = "Insert link" })
  map("n", "<leader>nm", M.move, { desc = "Move note" })
end

return M
