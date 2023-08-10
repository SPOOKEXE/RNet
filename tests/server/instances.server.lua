-- SERVER-SIDE
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local RNetController = require( ReplicatedStorage:WaitForChild('RNetModule') )
RNetController.StartService()

local Bridge = RNetController.Create("SpamEventRNet")

Bridge:OnServerEvent(function(LocalPlayer : Player, ... : any?)
	-- print("ping!")
	Bridge:FireClient(LocalPlayer, ...)
end)
