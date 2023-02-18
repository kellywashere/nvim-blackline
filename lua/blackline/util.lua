local M = {}

function M.set_cursorline(new_cursorline)
	-- new_cursorline can be either a fully formatted string like 'ctermbg=Black guibg=#ff0000'
	-- or it can be a color name like 'Black'
	-- or it can be a color nr like '#ff0000'

	if (string.find(new_cursorline, 'cterm') or string.find(new_cursorline, 'gui')) then
		vim.cmd('highlight CursorLine ' .. new_cursorline)
	elseif (vim.o.termguicolors) then
		vim.cmd('highlight CursorLine guibg=' .. new_cursorline)
	else
		vim.cmd('highlight CursorLine ctermbg=' .. new_cursorline)
	end
end

function M.get_cursorline()
	-- returns current content of CursorLine highlight
	local cursorline = vim.api.nvim_exec('highlight CursorLine', true)
	local stridx1 = string.find(cursorline, 'cterm')
	local stridx2 = string.find(cursorline, 'gui')
	local stridx = stridx1
	if (not stridx or (stridx2 and stridx2 < stridx)) then
		stridx = stridx2
	end
	return string.sub(cursorline, stridx)
end

return M

