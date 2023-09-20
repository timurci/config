local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.cmd "colorscheme habamax"
	vim.notify(
		"Warning: colorscheme " .. colorscheme .. " not found.",
		vim.log.levels.WARN
	)
end

-- Transparency
-- vim.cmd "colorcheme oxocarbon"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
