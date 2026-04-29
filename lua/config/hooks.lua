vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, path = ev.data.spec.name, ev.data.path
		if name == "telescope-fzf-native.nvim" then
			vim.system({ "make" }, { cwd = path }):wait()
		end
    print(vim.inspect(ev))
		if name == "markdown-preview.nvim" then
			vim.fn["mkdp#util#install"]()
		end
	end,
})

vim.api.nvim_create_user_command("CopyPath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
