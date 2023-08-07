-- SERVER-SIDE
local HttpService = game:GetService('HttpService')

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local RNetController = require( ReplicatedStorage:WaitForChild('RNetModule') )
RNetController.StartService()

local Bridge = RNetController.Create("SpamEventRNet")

local function GenerateUIDRep( len )
	local s = ""
	for _ = 1, len do
		s ..= HttpService:GenerateGUID(false)
	end
	return s
end

Bridge:OnServerEvent(function(LocalPlayer : Player, a)
	print(#a)
	Bridge:FireClient(LocalPlayer, GenerateUIDRep( 50 ))
end)
