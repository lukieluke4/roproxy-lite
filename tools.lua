syn.queue_on_teleport([[
  repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character
  Wait(1)
  loadstring(game:HttpGet("https://raw.githubusercontent.com/lukieluke4/roproxy-lite/main/tools.lua"))()
]])

local Backpack = game.Players.LocalPlayer:FindFirstChildOfClass("Backpack")
local ammount = 10
local delay_ = 0.01
wait(8)
while true do 
for _, v in ipairs(Backpack:GetChildren()) do
	v.Parent = game.Players.LocalPlayer.Character
    if v.Name == "Capacitor" then 
        print("no")
    elseif v.Name == "Upgrade Module" then
        print("no")
    else
    	for _ = 1, ammount do
    		v:Activate()
    		if delay_ then
    			wait(delay_)
    		end
    	end
	end
	v.Parent = Backpack
end
end
