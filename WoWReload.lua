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
    self:RegisterEvent("ASSET_MISSING")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")

    self.name = addonName;
    self.options = WoWReloadPanelOptions;
end

function WoWReload_OnEvent(self, event, ...)
    BlizzardOptionsPanel_OnEvent(self, event, ...)
    if event == "ADDON_LOADED" then
        local addon = ...
        if addon == addonName then
            InterfaceOptionsPanel_OnLoad(self);
            self:SetScript("OnEvent", WoWReload_OnEvent);
        end
    elseif event == "ASSET_MISSING" then
        local asset = ...
        if asset ~= nil then
            WoWReloadScrollFrameText:SetText(asset)
        end
    end
end

function WoWReloadWDBDropDown_OnClick(self)
    WoWReloadWDBDropDown:SetValue(self.value);
end

function WoWReloadWDBDropDown_Initialize()
    local selectedValue = UIDropDownMenu_GetSelectedValue(WoWReloadWDBDropDown);
    local info = UIDropDownMenu_CreateInfo();
    info.tooltipOnButton = 1;

    info.text = "Creature";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "1";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);

    info.text = "GameObject";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "2";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);

    info.text = "Item";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "3";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);

    info.text = "ItemName";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "4";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end

    info.text = "ItemText";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "5";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end

    info.text = "NPC";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "6";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end

    info.text = "PageText";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "7";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);

    info.text = "Quest";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "8";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);

    info.text = "WoW";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "9";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
        UIDropDownMenu_AddButton(info);

    info.text = "Name";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "10";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
        UIDropDownMenu_AddButton(info);

    info.text = "PetName";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "11";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
        UIDropDownMenu_AddButton(info);

    info.text = "Guild";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "12";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end

    info.text = "Petition";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "13";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
        UIDropDownMenu_AddButton(info);

    info.text = "ArenaTeam";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "14";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
        UIDropDownMenu_AddButton(info);

    info.text = "Dance";
    info.func = WoWReloadWDBDropDown_OnClick;
    info.value = "15";
    if ( info.value == selectedValue ) then
        info.checked = 1;
    else
        info.checked = nil;
    end
    UIDropDownMenu_AddButton(info);
end

function WoWReloadWDBDropDown_OnEvent(self, event, ...)
    if ( event == "PLAYER_ENTERING_WORLD" ) then
        self.defaultValue = 1;
        self.value = 1;
        self.oldValue = 1;

        UIDropDownMenu_SetWidth(self, 90);
        UIDropDownMenu_Initialize(self, WoWReloadWDBDropDown_Initialize);
        UIDropDownMenu_SetSelectedValue(self, value);

        self.SetValue = 
            function (self, value)
                self.value = value;
                UIDropDownMenu_SetSelectedValue(self, value);
            end
        self.GetValue =
            function (self)
                return UIDropDownMenu_GetSelectedValue(self);
            end
        self.RefreshValue =
            function (self)
                UIDropDownMenu_Initialize(self, WoWReloadWDBDropDown_Initialize);
                UIDropDownMenu_SetSelectedValue(self, self.value);
            end
            
        self:UnregisterEvent(event);
    end
end

function WoWReloadScrollFrame_OnLoad(self)
end

function WoWReloadScrollFrame_OnShow(self)
	WoWReloadScrollFrame_Update();
end

function WoWReloadScrollFrame_Update()
end