syn.queue_on_teleport([[
  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
  Wait(1)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/kill.lua"))()
]])

print("running")
destroylist = {"Cactus", "SmallCactus", "VaultTable", "RandomWall", "Tent"}
--game.Workspace.Gravity = 0
local pbox = nil
local pplate = nil
local retries = 0
local handle = nil
while true do
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
            for i,v in pairs(game:service"Workspace":GetDescendants()) do
                pcall(function()
                if handleExists then 
                    if v.Name == "Enemy" then
                        firetouchinterest(v.Parent.Head, handle, 0)
                        firetouchinterest(v.Parent.Torso, handle, 0)
                        firetouchinterest(v.Parent.Head, handle, 1)
                        firetouchinterest(v.Parent.Torso, handle, 1)
                        pcall(function()
                            firetouchinterest(v.Parent.HumanoidRootPart, handle, 0)
                            firetouchinterest(v.Parent.HumanoidRootPart, handle, 1)
                        end)
                    end
                end
            end)
        end
    end)
    wait()
end



