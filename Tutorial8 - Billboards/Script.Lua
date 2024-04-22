-- Level: basic
-- This code is allow the player to interact with a BillboardGui to create a question,  explode when answers wrong and has a Chest when answers well
-- Check tutorial: https://youtu.be/1YLYMpDl578

local Buttons = script.Parent
local ButtonLeft= Buttons.ButtonLeft
local ButtonRight= Buttons.ButtonRight

local ChestValue = Buttons.ChestValue
local Chest = ChestValue.Value

local BillboardGui = Buttons.Parent.Parent
local adornee = BillboardGui.Adornee

ButtonLeft.Activated:Connect(function()
	local explosion = Instance.new("Explosion")
	explosion.BlastRadius = 60
	explosion.ExplosionType = Enum.ExplosionType.Craters
	explosion.Parent = adornee
	explosion.Position = adornee:GetPivot().Position
	BillboardGui.Enabled = false
	
end)

ButtonRight.Activated:Connect(function()
	Chest.Transparency = 0
	Chest.CanCollide = true
	BillboardGui.Enabled = false

end)


