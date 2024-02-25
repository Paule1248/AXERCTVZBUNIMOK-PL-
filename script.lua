local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "PS99", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "Ps99"})

--Values
_G.autohatch = true
_G.SelectEgg = "Tech Ciruit Egg"
_G.EggAmount = 1
_G.UltimateSelected = "Ground Pound"
_G.autoUltimateuse = true
_G.WebhookUse = ""
_G.Webhookstats = true
_G.webhookwait = 30
local WebhookUse = _G.WebhookUse

--Functions
function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10043.3134765625, 16.506406784057617, -314.23333740234375)
            wait(.0001)
        end
    end
function autoUltimate()
    while _G.autoUltimateuse == true do
            game:GetService("ReplicatedStorage").Network["Ultimates: Activate"]:InvokeServer(_G.UltimateSelected)
            wait(.05)
        end
    end
function sendWebhook_stats()
	while _G.Webhookstats == true do
		function SendMessage(url, message)
			local http = game:GetService("HttpService")
			local headers = {
				["Content-Type"] = "application/json"
			}
			local data = {
				["content"] = message
			}
			local body = http:JSONEncode(data)
			local response = request({
				Url = url,
				Method = "POST",
				Headers = headers,
				Body = body
			})
		end
		
		function SendMessageEMBED(url, embed)
			local http = game:GetService("HttpService")
			local headers = {
				["Content-Type"] = "application/json"
			}
			local data = {
				["embeds"] = {
					{
						["title"] = embed.title,
						["description"] = embed.description,
						["color"] = embed.color,
						["fields"] = embed.fields,
						["footer"] = {
							["text"] = embed.footer.text
						}
					}
				}
			}
			local body = http:JSONEncode(data)
			local response = request({
				Url = url,
				Method = "POST",
				Headers = headers,
				Body = body
			})
		end
		
		
		--Examples 
		local url = _G.WebhookUse
		SendMessage(url, "Hello")
		
		
		local embed = {
			["title"] = "Test",
			--["description"] = "Test Desc",
			["color"] = 65280,
			["fields"] = {
				{
					["name"] = "Stats",
					["value"] = "AA"
				},
				--{
					--["name"] = "Field 2",
					--["value"] = "This is the second field"
				--}
			},
			["footer"] = {
				["text"] = "LOL"
			}
		}
		SendMessageEMBED(url, embed)
		wait(30)

	end
end
--Tabs
local MainTab = Window:MakeTab({
	Name = "MainFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
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
local WebhookTab = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--sections

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
	end    
})

--dropdowns
MainTab:AddDropdown({
	Name = "Select Ultimate",
	Default = "Ground Pound",
	Options = {"Ground Pound", "Black Hole", "Chest Spell", "Tornado", "Pet Surge", "TNT Shower"},
	Callback = function(Value)
		_G.UltimateSelected = Value
	end    
})
EggTab:AddDropdown({
	Name = "Select Egg",
	Default = "Tech Ciruit Egg",
	Options = {"Tech Ciruit Egg", "Tech City Egg"},
	Callback = function(Value)
		_G.SelectEgg = Value
	end    
})

--Toogles
EggTab:AddToggle({
	Name = "AutoHatch (PC)",
	Default = false,
	Callback = function(Value)
        _G.autohatch = Value
		autohatch()
	end
})
WebhookTab:AddToggle({
	Name = "StatWebhook",
	Default = false,
	Callback = function(Value)
        _G.Webhookstats = Value
		sendWebhook_stats()
	end
})
MainTab:AddToggle({
	Name = "Auto Use Ultimate",
	Default = false,
	Callback = function(Value)
        _G.autoUltimateuse = Value
		autoUltimate()
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

--Adaptive Input
EggTab:AddTextbox({
	Name = "Amount Eggs (Mobile)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.EggAmountMobile = Value
	end	  
})
WebhookTab:AddTextbox({
	Name = "Input Webhook",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.WebhookUse = Value
	end	  
})
WebhookTab:AddTextbox({
	Name = "Webhook delay",
	Default = "30",
	TextDisappear = false,
	Callback = function(Value)
		_G.webhookwait = Value
	end	  
})
