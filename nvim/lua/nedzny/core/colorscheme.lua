local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
	print("Colorsheme not found")
	return
end
