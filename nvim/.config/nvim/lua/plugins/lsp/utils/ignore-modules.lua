local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterLocalFiles(value)
	if string.match(value.filename, "react/index.d.ts") then
		return false
	end

	if string.match(value.filename, "node_modules/") then
		return false
	end

	return true
end

local function on_list(options)
	local items = options.items
	if #items > 1 then
		items = filter(items, filterLocalFiles)
	end

	vim.fn.setqflist({}, " ", { title = options.title, items = items, context = options.context })
	vim.api.nvim_command("cfirst")
end

return on_list
