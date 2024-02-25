local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Window = Rayfield:CreateWindow({
    Name = "PS99",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Paule",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = Config, -- Create a custom folder for your hub/game
       FileName = "PS99"
    },
    Discord = {
       Enabled = false,
       Invite = "sirius", -- The Discord invite code, do not include discord.gg/
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
    }
 })

--Values
_G.autohatch = true
_G.SelectEgg = "Tech Ciruit Egg"
_G.EggAmount = 1
_G.UltimateSelected = "Ground Pound"
_G.autoUltimateuse = true
_G.WebhookUse = ""
_G.Webhookstats = true
_G.webhookwait = 30
_G.antiafk = true
_G.AcceptMailbox = true
local WebhookUse = _G.WebhookUse

--Functions
function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10043.3134765625, 16.506406784057617, -314.23333740234375)
            wait(.0001)
        end
    end
function antiafk()
    while _G.antiafk == true do
            --game:GetService("ReplicatedStorage").Network.Click:FireServer(Ray.new({-10021.9736, 92.3745041, -376.680084}, {-0.813847959, -0.320810258, 0.484491765}),),
            game:GetService("ReplicatedStorage").Network["Idle Tracking: Stop Timer"]:FireServer()
            wait(60)
        end
    end
function autoUltimate()
    while _G.autoUltimateuse == true do
            game:GetService("ReplicatedStorage").Network["Ultimates: Activate"]:InvokeServer(_G.UltimateSelected)
            wait(.05)
        end
    end
function AcceptMailbox()
    while _G.AcceptMailbox == true do
            game:GetService("ReplicatedStorage").Network["Mailbox: Claim All"]:InvokeServer({})  
            wait(1)
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

--tabs
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Mailbox = Window:CreateTab("Misc", 4483362458) -- Title, Image

--toggles
local Toggle = Tab:CreateToggle({
    Name = "Auto Hatch",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autohatch = Value
		autohatch()
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Remove Egg animation",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Use Ultimate",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autoUltimateuse = Value
		autoUltimate()
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Antiafk",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.Antiafk = value
        antiafk()
    end,
 })
 local Toggle = Mailbox:CreateToggle({
    Name = "AcceptMail",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.AcceptMailbox = value
        AcceptMailbox()
    end,
 })

 --buttons
 local Button = Tab:CreateButton({
    Name = "AntiRoblox kick",
    Info = "Button info/Description.", -- Speaks for itself, Remove if none.
    Interact = 'Changable',
    Callback = function()
        local bb=game:service'VirtualUser'
        game:service'Players'.LocalPlayer.Idled:connect(function()
        bb:CaptureController()bb:ClickButton2(Vector2.new())
        ab.Text="You went idle and ROBLOX tried to kick you but we reflected it!"wait(2)ab.Text="Script Re-Enabled"end)
    end,
 })




--slider
local Slider = Tab:CreateSlider({
    Name = "Egg Amount",
    Info = "Button info/Description.", -- Speaks for itself, Remove if none.
    Range = {0, 99},
    Increment = 1,
    Suffix = "Eggs",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.EggAmount = Value
    end,
 }),

--buttons



 Rayfield:LoadConfiguration()
