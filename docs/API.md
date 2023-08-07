
# RNet API

```lua
-- SERVER-SIDE
local RNetController = require(RNet)
RNetController.StartService()
RNetController.StopService()

local PlayerDataBridge = RNetController.Create("PlayerData")

PlayerDataBridge:OnServerEvent:Connect(function(LocalPlayer : Player, ... : any?)
	warn("Player sent values to server: ", ...)
	PlayerDataBridge:FireClient( LocalPlayer, "this should be first" )
	PlayerDataBridge:FireClient( LocalPlayer, "this should be second" )
	PlayerDataBridge:FireClient( LocalPlayer, "this should be third" )
end)

-- CLIENT-SIDE
local RNetController = require(RNet)
RNetController.StartService()
RNetController.StopService()

local PlayerDataBridge = RNetController.Create("PlayerData")

PlayerDataBridge:OnClientEvent(print)
PlayerDataBridge:FireServer()
```
