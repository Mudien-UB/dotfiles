-- Setup Live Server
-- Require "# npm install -g live-server"

local M = {}

M.running = false
M.term_bufnr = nil
M.term_win = nil
M.port = 5500

function M.start()
  if M.running then
    vim.notify("Live Server already running at http://127.0.0.1:" .. M.port, vim.log.levels.WARN)
    return
  end

  vim.cmd("terminal live-server --port=" .. M.port)
  M.term_win = vim.api.nvim_get_current_win()
  M.term_bufnr = vim.api.nvim_get_current_buf()
  M.running = true

  vim.schedule(function()
    vim.notify("Live Server started at http://127.0.0.1:" .. M.port, vim.log.levels.INFO)
  end)
end

function M.stop()
  if not M.running then
    vim.notify("Live Server is not running", vim.log.levels.WARN)
    return
  end

  if M.term_bufnr and vim.api.nvim_buf_is_valid(M.term_bufnr) then
    vim.api.nvim_buf_delete(M.term_bufnr, { force = true })
  end
  M.running = false
  M.term_bufnr = nil
  M.term_win = nil

  vim.notify("Live Server stopped", vim.log.levels.INFO)
end

function M.toggle()
  if M.running then
    M.stop()
  else
    M.start()
  end
end

vim.keymap.set("n", "<leader>cLs", M.toggle, { desc = "Toggle Live Server" })
vim.keymap.set("n", "<leader>cLS", M.stop, { desc = "Stop Live Server" })
vim.keymap.set("n", "<leader>cLV", M.start, { desc = "Start Live Server" })

return M
