local M = {}

function M.set_cursorline(new_cursorline)
	-- sets cursorline color
	local stridx1 = string.find(new_cursorline, 'ctermbg')
	local stridx2 = string.find(new_cursorline, 'guibg')
	-- check if string is already formatted to go into vim command
	if (stridx1 or stridx2) then
		vim.cmd('highlight CursorLine ' .. new_cursorline)
	else
		vim.cmd('highlight CursorLine guibg=' .. new_cursorline)
	end
end

function M.get_cursorline()
	-- returns current content of CursorLine highlight
	local cursorline = vim.api.nvim_exec('highlight CursorLine', true)
	local stridx1 = string.find(cursorline, 'ctermbg=')
	local stridx2 = string.find(cursorline, 'guibg=')
	local stridx = stridx1
	if (not stridx or (stridx2 and stridx2 < stridx)) then
		stridx = stridx2
	end
	return string.sub(cursorline, stridx)
end

return M

