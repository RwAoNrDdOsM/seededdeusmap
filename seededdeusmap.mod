return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`seededdeusmap` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("seededdeusmap", {
			mod_script       = "scripts/mods/seededdeusmap/seededdeusmap",
			mod_data         = "scripts/mods/seededdeusmap/seededdeusmap_data",
			mod_localization = "scripts/mods/seededdeusmap/seededdeusmap_localization",
		})
	end,
	packages = {
		"resource_packages/seededdeusmap/seededdeusmap",
	},
}
