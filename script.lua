local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "PS99 Autohatch " .. Fluent.Version,
    SubTitle = "by Yusei",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}


--Values
_G.autohatch = true
_G.SelectEgg = "Tech Ciruit Egg"
_G.EggAmount = 1

--Functions
function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10043.3134765625, 16.506406784057617, -314.23333740234375)
            wait(.0001)
        end
    end


--toggle
local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Auto Hatch", Default = false })
Toggle:OnChanged(function(Value)
    _G.autohatch = Value
	autohatch()
end)

--dropdown
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"Tech Ciruit Egg"},
    Multi = false,
    Default = 1,
})
Dropdown:OnChanged(function(Value)
    _G.UltimateSelected = Value
end)



--slider
local Slider = Tabs.Main:AddSlider("Slider", {
    Title = "Select Egg",
    Description = "Eggs",
    Default = 1,
    Min = 1,
    Max = 99,
    Rounding = 0,
    Callback = function(Value)
        _G.EggAmount = Value
    end
})


Tabs.Misc:AddButton({
    Title = "Remove Egg Animation",
    Description = "Very important button",
    Callback = function()
        local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return end
    end
})
Tabs.Misc:AddButton({
    Title = "rejoin current server",
    Description = "Very important button",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
    end
})
Tabs.Misc:AddButton({
    Title = "Safe settings",
    Description = "Very important button",
    Callback = function()
        SaveManager:SetLibrary(Fluent)
        SaveManager:SetFolder("FluentScriptHub/specific-game")
    end
})








SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})
SaveManager:LoadAutoloadConfig()
