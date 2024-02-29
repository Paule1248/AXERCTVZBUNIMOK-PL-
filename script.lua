local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PetInventory = require(ReplicatedStorage:WaitForChild("Library")).Save.Get().Inventory.Pet
local substringToFind = "Huge"
local petUID = nil




while _G.autohatch == true do
    game:GetService("ReplicatedStorage").Network.Eggs_RequestPurchase:InvokeServer(_G.UseEgg, _G.eggAmount)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-10040, 17, -314)
    wait(0.1)
end



while _G.SendMail == true do
    if petUID then
        game:GetService("ReplicatedStorage").Network.Locking_SetLocked:InvokeServer(petUID,false)
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(_G.UserName, "Leck Eier", "Pet", petUID, 1)
        wait(5)
    end
end

while _G.UseWebHook == true do
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
            local url = _G.WebHook
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
    end
end




game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false
local vu = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
