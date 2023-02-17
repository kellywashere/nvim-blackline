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
	M._icolor = (opts and opts.icolor) or cl
	M._ncolor = (opts and opts.ncolor) or cl

	local cursorlineGrp = vim.api.nvim_create_augroup("BlackLine", { clear = true })
	vim.api.nvim_create_autocmd(
		"InsertEnter",
		{
			group = cursorlineGrp,
			callback = function()
				util.set_cursorline(M._icolor)
			end
		}
	)
	vim.api.nvim_create_autocmd(
		"InsertLeave",
		{
			group = cursorlineGrp,
			callback = function()
				util.set_cursorline(M._ncolor)
			end
		}
	)
end

return M
