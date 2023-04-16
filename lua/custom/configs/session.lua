local session_status_ok, session = pcall(require, "mini.sessions")
if not session_status_ok then
  return
end

local M = {
  setup = function()
    session.setup({
      autoread = true,
      verbose = {
        read = true,
        write = true,
        delete = true
      },
    })
  end
}
return M
