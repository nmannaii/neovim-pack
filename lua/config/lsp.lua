-- Keymaps + built-in completion on every LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end)
		end

		local map = function(keys, fn, desc)
			vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		map("gd", function()
			require("telescope.builtin").lsp_definitions({ reuse_win = true })
		end, "Go to definition")

		map("gD", vim.lsp.buf.declaration, "Go to declaration")
		map("gr", "<cmd>Telescope lsp_references<cr>", "References")
		map("gi", function()
			require("telescope.builtin").lsp_implementations({ reuse_win = true })
		end, "Goto Implementation")

		map("gy", function()
			require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
		end, "Goto T[y]pe Definition")

		map("K", vim.lsp.buf.hover, "Hover docs")
		map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map("<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
		map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
		map("]d", vim.diagnostic.goto_next, "Next diagnostic")
	end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "RoslynRestoreProgress",
    callback = function(ev)
      print(vim.inspect(ev))
    end,
})

-- Configure lua_ls using the new built-in vim.lsp API (Neovim 0.11+)
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			completion = { callSnippet = "Replace" },
			diagnostics = { disable = { "missing-fields" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("protols", {
	cmd = {
		"protols",
		"-i=" .. vim.fn.getcwd() .. "/Proto",
	},
})
vim.lsp.enable("protols")
vim.lsp.enable("cssls")
vim.lsp.enable("angularls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tsgo")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")
