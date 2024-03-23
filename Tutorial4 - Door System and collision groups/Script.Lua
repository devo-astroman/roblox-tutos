-- Level: intermediate
-- This code allows the player to pass through doors depending on the touched platform, it uses the collisions groups
-- Check tutorial: https://youtu.be/hwENonYrMNQ
-- Import services
local PhysicsService = game:GetService("PhysicsService")
local Workspace = game:GetService("Workspace")

-- Define collision groups
local RED_GROUP = "RedGroup"
local GREEN_GROUP = "GreenGroup"
local BLUE_GROUP = "BlueGroup"
local DEFAULT_GROUP = "Default"

-- Register collision groups
PhysicsService:RegisterCollisionGroup(RED_GROUP)
PhysicsService:RegisterCollisionGroup(GREEN_GROUP)
PhysicsService:RegisterCollisionGroup(BLUE_GROUP)

-- Disable collisions within each group
PhysicsService:CollisionGroupSetCollidable(RED_GROUP, RED_GROUP, false)
PhysicsService:CollisionGroupSetCollidable(GREEN_GROUP, GREEN_GROUP, false)
PhysicsService:CollisionGroupSetCollidable(BLUE_GROUP, BLUE_GROUP, false)

-- Find doors
local redDoor = Workspace:FindFirstChild("Doors"):FindFirstChild("RedDoor")
local greenDoor = Workspace:FindFirstChild("Doors"):FindFirstChild("GreenDoor")
local blueDoor = Workspace:FindFirstChild("Doors"):FindFirstChild("BlueDoor")

-- Assign collision groups to doors
redDoor.CollisionGroup = RED_GROUP
greenDoor.CollisionGroup = GREEN_GROUP
blueDoor.CollisionGroup = BLUE_GROUP

-- Find platforms
local redPlatform = Workspace:FindFirstChild("Platforms"):FindFirstChild("RedPlatform")
local greenPlatform = Workspace:FindFirstChild("Platforms"):FindFirstChild("GreenPlatform")
local bluePlatform = Workspace:FindFirstChild("Platforms"):FindFirstChild("BluePlatform")
local whitePlatform = Workspace:FindFirstChild("Platforms"):FindFirstChild("WhitePlatform")


-- Store original color of white platform
local originalColor = Color3.fromRGB(243, 242, 243)

local function handleTouch(platform, group, color)
	local touchable = platform:FindFirstChild("Touchable")
	touchable.Touched:Connect(function(otherPart)
		local playerModel = otherPart.Parent
		for _, child in ipairs(playerModel:GetChildren()) do
			if child:IsA("BasePart")  then
				child.CollisionGroup = group
				child.Color = color
			end

		end
	end)

end



handleTouch(redPlatform, RED_GROUP, Color3.new(1, 0, 0))
handleTouch(greenPlatform, GREEN_GROUP, Color3.new(0, 1, 0))
handleTouch(bluePlatform, BLUE_GROUP, Color3.new(0, 0, 1))
handleTouch(whitePlatform, DEFAULT_GROUP, originalColor)

