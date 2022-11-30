syn.queue_on_teleport([[
  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
  Wait(1)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/teleport.lua"))()
]])


--game.Workspace.Gravity = 0
local retries = 0
pizza = false
game.Workspace.Gravity = 0
while not pizza do
    --game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
    pcall(function()
        print(retries)
        -- fire on all objects
        for i,v in pairs(game:service"Workspace":GetDescendants()) do
            if v.Name == "Enemy" then
                game.Players.LocalPlayer.Character:MoveTo(v.Parent.HumanoidRootPart.Position + Vector3.new(0,10,0))
            end         
        end
    end)
    wait()
end


