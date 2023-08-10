-- CLIENT-SIDE
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

local ReplicatedStorage = game:GetService('ReplicatedStorage')

local RNetController = require( ReplicatedStorage:WaitForChild('RNetModule') )
RNetController.StartService()

local Bridge = RNetController.Create("SpamEventRNet")

-- local Last = os.clock()
local Counter = 0
Bridge:OnClientEvent(function(a, ...)
	Counter += 1
	print(Counter)
	-- print("pong!")
	-- print(os.clock() - Last, " duration - message length " .. #a)
	-- Last = os.clock()
	Bridge:FireServer(a,...)
end)

Bridge:FireServer({
	[LocalPlayer] = 123,
	["123"] = LocalPlayer,
})
