syn.queue_on_teleport([[
  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
  Wait(1)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/emergency.lua"))()
]])

wait(100)

 local Remote = game.ReplicatedStorage['GuiEvent']

                                local Arguments = {
                                        [1] = "Restart"
                                }

                                Remote:FireServer(unpack(Arguments))
