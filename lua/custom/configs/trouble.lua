local trouble_status_ok, trouble = pcall(require, "trouble")
if not trouble_status_ok then
  return
end

local M = {
  setup = function()
    trouble.setup({
      mode='document_diagnostics',
      cycle_results=false,
    })
  end
}
return M
