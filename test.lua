
pizza_found = false
print("pizza finding")
while not pizza_found do
    pcall(function()
        wait(10)
        fireclickdetector(game.Workspace.Room.Enemies.StartButton.ClickDetector)
        wait(3)
        for i,v in pairs(game:service"Workspace".GenValues:GetDescendants()) do
            has_word = v.Name:find("izza", 1, true)
            if has_word == nil then
                print()
            else
                print(v.Name)
                print("pizza found")
                pizza_found = true
                break
            end
        end
    end)
    wait()
    if not pizza_found then
        game.Players.LocalPlayer.OnTeleport:Connect(function(State)
            if State == Enum.TeleportState.InProgress and syn then
                syn.queue_on_teleport([[
                    repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
                    Wait(1)
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/test.lua"))()
                ]])
            end
        end)
        local Remote = game.ReplicatedStorage['GuiEvent']
        
        local Arguments = {
                [1] = "Restart"
        }
        
        Remote:FireServer(unpack(Arguments))
    end
end
