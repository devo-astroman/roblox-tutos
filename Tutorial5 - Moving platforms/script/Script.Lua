-- Level: basic
-- This code allows the player to interact with two proximity prompts in order to move a platform
-- Check tutorial: https://youtu.be/YhYyHNajeKw

local proximityPrompt0 = script.Parent.Panel0.ProximityPrompt
local proximityPrompt1 = script.Parent.Panel1.ProximityPrompt

local prismaticConstraint = script.Parent.Rail.PrismaticConstraint
proximityPrompt0.Triggered:Connect(function()	
	print("panel0")
	prismaticConstraint.TargetPosition = -35
	end)

proximityPrompt1.Triggered:Connect(function()
	print("panel1")
	prismaticConstraint.TargetPosition = 0
end)

