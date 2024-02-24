local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PS99", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "Ps99"})

--Values
_G.autohatch = true
_G.SelectEgg = "Tech Ciruit Egg"
_G.EggAmount = 1

--Functions

function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
            wait(.0001)
        end
    end

function AutoTeleportToEgg()
    while

--Tabs
local EggTab = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--slider
EggTab:AddSlider({
	Name = "Egg Amount",
	Min = 1,
	Max = 99,
	Default = 1,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "EggAmount",
	Callback = function(Value)
		_G.EggAmount = Value
        print(_G.EggAmount)
	end    
})

--dropdowns

EggTab:AddDropdown({
	Name = "Select egg",
	Default = "Tech Ciruit Egg",
	Options = {"Tech Ciruit Egg", "Tech City Egg"},
	Callback = function(Value)
		_G.SelectEgg = Value
        print(_G.SelectEgg)
	end    
})


--Toogles
EggTab:AddToggle({
	Name = "AutoHatch",
	Default = false,
	Callback = function(Value)
        _G.autohatch = Value
		autohatch()
	end
})



--buttons
EggTab:AddButton({
	Name = "Desable Egg animations",
	Callback = function()
        local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return end
  	end    
})
MiscTab:AddButton({
	Name = "rejoin current server",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
  	end    
})