require("fidget").setup({})
require("which-key").setup({
	preset = "helix",
})

local job_indicator = { require("easy-dotnet.ui-modules.jobs").lualine }

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = { "mode", job_indicator },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
			{
				"overseer",
				label = "Tasks: ", -- This is the label prefix
				colored = true, -- Use colors for different statuses
				symbols = {
					[require("overseer").STATUS.FAILURE] = ":",
					[require("overseer").STATUS.CANCELED] = ":",
					[require("overseer").STATUS.SUCCESS] = ":",
					[require("overseer").STATUS.RUNNING] = ":",
				},
				unique = false, -- If true, only show the most "urgent" status
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

require("scope").setup({})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				vertical_center = true,
				header = {
					"*************************************",
					"*   ███████╗   ███████╗   ██████╗   *",
					"*   ╚══███╔╝   ██╔════╝   ██╔══██╗  *",
					"*     ███╔╝    █████╗     ██║  ██║  *",
					"*    ███╔╝     ██╔══╝     ██║  ██║  *",
					"*   ███████╗██╗███████╗██╗██████╔╝  *",
					"*   ╚══════╝╚═╝╚══════╝╚═╝╚═════╝   *",
					"*************************************",
          "",
          "",
          "",
				},
				center = {
					{
						action = "Telescope find_files",
						desc = " Find File",
						icon = " ",
						key = "f",
					},
					{
						action = "ene | startinsert",
						desc = " New File",
						icon = " ",
						key = "n",
					},
					{
						action = "Telescope grep_text",
						desc = " Find Text",
						icon = " ",
						key = "g",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " Restore Session",
						icon = " ",
						key = "s",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " Quit",
						icon = " ",
						key = "q",
					},
				},
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		require("dashboard").setup(opts)
	end,
})
