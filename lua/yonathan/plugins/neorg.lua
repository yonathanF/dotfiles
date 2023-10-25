-- import comment plugin safely
local setup, neorg = pcall(require, "neorg")
if not setup then
	return
end

-- enable neorg
neorg.setup({
	load = {
		["core.defaults"] = {}, -- Loads default behaviour
		["core.concealer"] = {}, -- Adds pretty icons to your documents
		["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "/home/yonathan/Sync/neorg",
				},
			},
		},
	},
})
