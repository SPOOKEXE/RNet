
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SpamEvent = ReplicatedStorage:WaitForChild('SpamEvent')

local MESSAGES = {
	SHORT = "this_is_a_small_message",
	LONG = string.rep("this_is_a_very_long_message_", 80)
}

-- local Last = os.clock()
local Counter = 0
SpamEvent.OnClientEvent:Connect(function(a, ...)
	Counter += 1
	print(Counter)
	-- print("pong!")
	-- print(os.clock() - Last, " duration - message length " .. #a)
	-- Last = os.clock()
	SpamEvent:FireServer(...)
end)

for _ = 1, 25 do
	SpamEvent:FireServer(MESSAGES.SHORT)
	SpamEvent:FireServer(MESSAGES.LONG)
end
