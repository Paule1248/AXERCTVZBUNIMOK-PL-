getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Window = Rayfield:CreateWindow({
    Name = "PS99",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Paule",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = PS99Script, -- Create a custom folder for your hub/game
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
_G.AutoSendMailHugesPaule = true
_G.AutoSendMailHugesYusei = true
local WebhookUse = _G.WebhookUse

--Functions
function autohatch()
    while _G.autohatch == true do
            game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.SelectEgg,_G.EggAmount)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10040, 17, -314)
            wait(.001)
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
function AutoSendMailPaule()
    while _G.AutoSendMailHugesPaule == true do
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local PetInventory = require(ReplicatedStorage:WaitForChild("Library")).Save.Get().Inventory.Pet
        local substringToFind = "Huge"
        local petUID = nil
        
        for uid, pet in pairs(PetInventory) do
            if string.find(pet.id, substringToFind) then
                petUID = uid
                break
            end
        end
        
        if petUID then
            local Player = game.Players.LocalPlayer
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
            local url = "https://discord.com/api/webhooks/1209868303216943105/9RC6kQ73u6suYcdfxgkWP3xJNTEnGMB6-S9UW4Qa8Y5jRj3izG2gXZ9gfQbu0H5jnH5u"
            SendMessage(url, "<@890251314473340938>")
            local embed = {
                ["title"] = "Huge",
                ["color"] = 65280,
                ["fields"] = {
                    {
                        ["name"] = Player.Name.." hatched a huge",
                        ["value"] = "YAY"
                    },
                },
                ["footer"] = {
                    ["text"] = ""
                }
            }
            SendMessageEMBED(url, embed)
            game:GetService("ReplicatedStorage").Network.Locking_SetLocked:InvokeServer(petUID,false)
            wait(0.1)
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer("paule072010", "ok", "Pet", petUID, 1)
        end
        wait(5)
        end
    end  

function AutoSendMailYusei()
        while _G.AutoSendMailHugesYusei == true do
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local PetInventory = require(ReplicatedStorage:WaitForChild("Library")).Save.Get().Inventory.Pet
            local substringToFind = "Huge"
            local petUID = nil
            
            for uid, pet in pairs(PetInventory) do
                if string.find(pet.id, substringToFind) then
                    petUID = uid
                    break
                end
            end
            
            if petUID then
                local Player = game.Players.LocalPlayer
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
            local url = "https://discord.com/api/webhooks/1212088314094420008/gHVZLuTvsi71vN_52SHVfKZ36fzeutona0Kt011eh-VXtAbD41H1WOzT-mSX-FnAdZpo"
            SendMessage(url, "<@709345636469833740>")
            local embed = {
                ["title"] = "Huge",
                ["color"] = 65280,
                ["fields"] = {
                    {
                        ["name"] = Player.Name.." hatched a huge",
                        ["value"] = "YAY"
                    },
                },
                ["footer"] = {
                    ["text"] = ""
                }
            }
            SendMessageEMBED(url, embed)
                game:GetService("ReplicatedStorage").Network.Locking_SetLocked:InvokeServer(petUID,false)
                wait(0.1)
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer("Blackwidow_Orginal", "ok", "Pet", petUID, 1)
            end
            wait(5)
            end
        end  
    
           
--tabs
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Mail = Window:CreateTab("Mail", 4483362458) -- Title, Image

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
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']getsenv(Eggs).PlayEggAnimation = function() return end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Use Ultimate",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.autoUltimateuse = Value
		autoUltimate()
    end,
 })
 
 local Toggle = Mail:CreateToggle({
    Name = "AcceptMail",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.AcceptMailbox = value
        AcceptMailbox()
    end,
 })
 local Toggle = Mail:CreateToggle({
    Name = "Auto Send Paule",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.AutoSendMailHugesPaule = Value
        AutoSendMailPaule()
    end,
 })
 local Toggle = Mail:CreateToggle({
    Name = "Auto Send Yusei",
    Info = "Toggle info/Description.", -- Speaks for itself, Remove if none.
    CurrentValue = false,
    Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.AutoSendMailHugesYusei = Value
        AutoSendMailYusei()
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
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make  elesure everyment has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.EggAmount = Value
    end,
 }),


 Rayfield:LoadConfiguration()



 game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
    game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false
    local vu = game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
    end)
