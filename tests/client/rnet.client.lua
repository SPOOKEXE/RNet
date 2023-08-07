-- CLIENT-SIDE
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local RNetController = require( ReplicatedStorage:WaitForChild('RNetModule') )
RNetController.StartService()

local Bridge = RNetController.Create("SpamEventRNet")

local MESSAGES = {
	SHORT = string.rep("this_is_a_small_message", 4),
	LONG = string.rep("this_is_a_very_long_message_", 160)
}

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

for _ = 1, 25 do
	Bridge:FireServer(MESSAGES.SHORT)
	Bridge:FireServer(MESSAGES.LONG)
end
