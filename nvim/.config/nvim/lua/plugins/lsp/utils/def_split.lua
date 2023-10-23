local function definition_to_the_side()
	local params = vim.lsp.util.make_position_params()
	local method = "textDocument/definition"
	local results = vim.lsp.buf_request_sync(0, method, params, 1000)

	for _, result in pairs(results or {}) do
		local locations = result.result
		if locations and #locations > 0 then
			vim.cmd("vsplit " .. vim.uri_to_fname(locations[1].targetUri))
			vim.api.nvim_win_set_cursor(
				0,
				{ locations[1].targetRange.start.line + 1, locations[1].targetRange.start.character }
			)
			return
		end
	end

	print("No definition found")
end

return definition_to_the_side
