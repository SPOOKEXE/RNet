-- CLIENT-SIDE
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

Bridge:OnClientEvent(function(value)
	print(#value)
	Bridge:FireServer( GenerateUIDRep( 50 ) )
end)

Bridge:FireServer( GenerateUIDRep( 50 ) )
