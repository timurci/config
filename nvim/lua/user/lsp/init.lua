local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify(
		"Warning: lspconfig is not found.",
		vim.log.levels.WARN
	)
	return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
