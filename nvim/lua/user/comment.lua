local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify(
		"Warning: Comment is not found.",
		vim.log.levels.WARN
	)
	return
end

comment.setup()
