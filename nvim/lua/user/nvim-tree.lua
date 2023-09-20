local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify(
		"Warning: nvim-tree is not found.",
		vim.log.levels.WARN
	)
	return
end

nvim_tree.setup()
