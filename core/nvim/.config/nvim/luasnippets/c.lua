local function header_name(_, snip)
	return snip.env.TM_FILENAME:gsub("%.h$", ""):upper():gsub("[^A-Z0-9]", "_") .. "_H"
	-- return gsub(filename, ".", "_")
end
return {
	-- Global snippets that work in all filetypes can be in _global/init.lua
	-- Filetype-specific snippets go in their respective files

	-- Example C snippets
	s("#once", {
		t("#ifndef "),
		f(header_name, {}),
		t({ "", "#define " }),
		f(header_name, {}),
		t({ "", "" }),
		i(0),
		t({ "", "", "#endif" }),
	}),

	-- More C-specific snippets can be added here
}
