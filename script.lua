local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PS99", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "Ps99"})

--Values
_G.autohatch = true
_G.SelectEgg = "Tech Ciruit Egg"
_G.EggAmount = 1
_G.autoconsumeFruits = true



--Functions

function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
            wait(.0001)
        end
    end
--consume Fruits
function autoconsumeFruits()
    while _G.autoconsumeFruits == true do      
        game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("bea094be6eac4024a969dbf1ec436330",1)
        wait(0.1)
        game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("25c53be530b54728b97be1b81720a929",1)
        wait(0.1)
        game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("5cc6a6e2acb94467a92560e10b37f83e",1)
        wait(0.1)
        game:GetService("ReplicatedStorage").Network["Fruits: Consume"]:FireServer("a7408cf5fad4490a9a9b8ff5d379a392",1)    
        wait(0.1)
        end
    end
        
--Tabs
local EggTab = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local ItemsTab = Window:MakeTab({
	Name = "Items",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--sections
local Section = ItemsTab:AddSection({
	Name = "Auto Eat Fruits"
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
ItemsTab:AddDropdown({
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
--AutoConsume
ItemsTab:AddToggle({
	Name = "Eat all Fruits",
	Default = false,
	Callback = function(Value)
        _G.autoconsumeFruits = Value
        autoconsumeFruits()
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

