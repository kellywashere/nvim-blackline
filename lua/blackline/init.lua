util = require("blackline.util")

local M = {}

M.setup = function(opts) -- call after color scheme is activated!
	--[[

	icolor:
		color of CursorLine in insertmode
		default: the color from current color scheme
	ncolor:
		color of CursorLine in normal mode
		default: the color from current color scheme

	]]--
	local cl = util.get_cursorline() -- current setting
	M._i_from_colorscheme = not opts or not opts.icolor
	M._n_from_colorscheme = not opts or not opts.ncolor
	M._icolor = M._i_from_colorscheme and cl or opts.icolor
	M._ncolor = M._n_from_colorscheme and cl or opts.ncolor
	util.set_cursorline(M._ncolor)

	-- set autocmds for InsertEnter and InsertLeave
	local insGrp = vim.api.nvim_create_augroup("BlackLine_ins", { clear = true })
	vim.api.nvim_create_autocmd(
		"InsertEnter",
		{
			group = insGrp,
			callback = function()
				util.set_cursorline(M._icolor)
			end
		}
	)
	vim.api.nvim_create_autocmd(
		"InsertLeave",
		{
			group = insGrp,
			callback = function()
				util.set_cursorline(M._ncolor)
			end
		}
	)

	-- set autocmd for ColorScheme
	local colschGrp = vim.api.nvim_create_augroup("BlackLine_colsch", { clear = true })
	vim.api.nvim_create_autocmd(
		"ColorScheme",
		{
			group = colschGrp,
			callback = function()
				local cl = util.get_cursorline() -- current setting
				M._icolor = M._i_from_colorscheme and cl or M._icolor
				M._ncolor = M._n_from_colorscheme and cl or N._ncolor
				util.set_cursorline(M._ncolor)
			end
		}
	)

end

return M
