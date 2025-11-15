-- Rules Lazy Load this utils

local M = {}

local index_files = { "index.html", "index.php" }

function M.has_index_file()
  local cwd = vim.fn.getcwd()
  local uv = vim.loop
  for _, f in ipairs(index_files) do
    ---@diagnostic disable-next-line: undefined-field
    if uv.fs_stat(cwd .. "/" .. f) then
      return true
    end
  end
  return false
end

function M.load(show_warn)
  if M.has_index_file() then
    require("utils.live-server.live-server-util")
    vim.notify("Live Server loaded", vim.log.levels.INFO)
  elseif show_warn then
    vim.notify("No index.html or index.php found in cwd", vim.log.levels.WARN)
  end
end

function M.setup()
  M.load(false)
end

vim.keymap.set("n", "<leader>cLl", function()
  M.load(true)
end, { desc = "Load/Reload Live Server util" })

return M
