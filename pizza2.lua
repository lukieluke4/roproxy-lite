syn.queue_on_teleport([[
  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
  Wait(1)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/pizza2.lua"))()
]])

print("running")
destroylist = {"Cactus", "SmallCactus", "VaultTable", "RandomWall", "Tent"}
--game.Workspace.Gravity = 0
local pbox = nil
local pplate = nil
local retries = 0
local handle = nil
pizza = false
while not pizza do
    --game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
    pcall(function()
        print(retries)
        -- check for pizza, this is the most important part
        

        -- get handle for attacking enemies
        local handleExists = false
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("Tool") then
                handle = v.Handle
                handleExists = true
            end
        end

        -- destroy things in list
        

        -- fire on all objects
        for i,v in pairs(game:service"Workspace":GetDescendants()) do
            pcall(function()
                name = string.find(v.Name, "Pizza")
                if name > 0 then
                    print("OMG PIZZA")
                    fireclickdetector(v.ClickDetector)
                    fireclickdetector(v.ClickDetector)
                    pizza = true
                end
            end)

            for b = 1, #destroylist do
                if v.Name == destroylist[b] then
                    v:Destroy()
                end
            end
            -- attack all enemies

            -- click all buttons
            if v.Name == "Button" or v.Name == "StartButton" or v.Name == "RandomizerButton" then
                wait(.25)
                fireclickdetector(v.ClickDetector)
            end
            -- grab all circuits
            if v.Name == "Circuit" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
            end
            -- get box and make it disappear
            if v.Name == "PressurePlateScript" then
                pplate = v.Parent                
                for i,v in pairs(game:service"Workspace":GetDescendants()) do
                    if v.Name == "Box" then
                        firetouchinterest(v, pplate.Activator, 0)
                        firetouchinterest(v, pplate.Activator, 1)
                    end
                end
            end
            
            -- activate in shop
            if v.Name == "Items" and v.Parent.Name == "Room" then
                pcall(function()
                    lowestprice = 9999
                    lowestitem = nil
                    for index,item in pairs(v:GetChildren()) do
                        if index > 3 then -- only activate on last two items
                            if item.ItemValues.Price.Value < lowestprice then
                                lowestprice = item.ItemValues.Price.Value
                                lowestitem = item
                            end
                        end
                    end
                    print("Price", lowestprice)
                    -- condition to restart
                    print("Shopkeepers", game.Workspace.GenValues.ShopkeepersKilled)
                    if game.Players.LocalPlayer.NumValues.Circuits.Value < lowestprice then
                        if game.Workspace.GenValues.ShopkeepersKilled.Value > 0 then
                            if retries > 5 then
                                print("restarting")
                                local Remote = game.ReplicatedStorage['GuiEvent']

                                local Arguments = {
                                        [1] = "Restart"
                                }

                                Remote:FireServer(unpack(Arguments))
                                print("restarting")
                            end
                            wait(.5)
                            retries = retries + 1
                        end
                    end
                    wait(.25)
                    fireclickdetector(lowestitem.ClickDetector)
                    fireclickdetector(lowestitem.ClickDetector)
                end)
            end
        end
    end)
    wait()
end


