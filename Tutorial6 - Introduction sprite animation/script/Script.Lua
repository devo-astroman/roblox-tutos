-- Level: basic
-- This code is to animate a sprite sheet of numbers from 1 to 3 and create an explosion
-- Check tutorial: https://youtu.be/YhYyHNajeKw

wait(10)
local labFolder = script.Parent
local mine = labFolder.Mine
local part = mine.Part
local texture = part.Texture

local nTilesByRow = 3
local nTilesByCol = 1

texture.StudsPerTileU = part.Size.X*nTilesByRow
texture.StudsPerTileV = part.Size.Y*nTilesByCol

for i=nTilesByRow-1,0,-1 do
	texture.OffsetStudsU = i * part.Size.X
	wait(1)
end

local explosion = Instance.new("Explosion")
explosion.Position = mine.Position
explosion.Parent = workspace
mine:Destroy()


