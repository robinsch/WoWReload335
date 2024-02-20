local addonName = ...

WoWReloadPanelOptions = {
	watchADT = { text = ".adt" },
	watchWDT = { text = ".wdt" },
	watchWDL = { text = ".wdl" },
	watchTEX = { text = ".tex" },
	watchBLP = { text = ".blp" },
	watchM2 =  { text = ".m2"  },
	watchWMO = { text = ".wmo" },
	watchDBC = { text = ".dbc" },
	watchLUA = { text = ".lua" },
	watchXML = { text = ".xml" },
	watchTOC = { text = ".toc" },
}

function WoWReload_OnLoad(self)
	self:RegisterEvent("ADDON_LOADED")
	self.name = addonName;
	self.options = WoWReloadPanelOptions;
end

function WoWReload_OnEvent(self, event, ...)
	if event == "ADDON_LOADED" then
		local addon = ...
		if addon == addonName then
			InterfaceOptionsPanel_OnLoad(self);
		end
	end
end
