
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SpamEvent = Instance.new('RemoteEvent')
SpamEvent.Name = "SpamEvent"
SpamEvent.Parent = ReplicatedStorage

SpamEvent.OnServerEvent:Connect(function(player, ...)
	-- print("ping!")
	SpamEvent:FireClient(player, ...)
end)
