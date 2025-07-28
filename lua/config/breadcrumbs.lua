local M = {}

function M.filepath()
	local path = vim.fn.expand("%:~:.:h") -- relative path to buffer, hide home
	local file = vim.fn.expand("%:t") -- current filename

	if path == "." then
		return file
	end

	local parts = vim.split(path, "/", { plain = true })
	table.insert(parts, file)

	return " " .. table.concat(parts, " > ")
end

return M
