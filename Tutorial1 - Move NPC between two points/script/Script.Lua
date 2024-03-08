-- Level: basic
-- This code moves an avatar model from a point A to a point B
-- Check tutorial: https://youtu.be/OhEepENjBUQ
-- Wait for 4 seconds
wait(4)

-- Get the NPC and its Humanoid from the Lab folder in the workspace
local workspaceService = game:GetService("Workspace")
local labFolder = workspaceService:FindFirstChild("Lab")
local npc = labFolder:FindFirstChild("NPC")
local npcHumanoid = npc:FindFirstChild("Humanoid")

-- Get points P0 and P1 from the Lab folder
local p0 = labFolder:FindFirstChild("P0")
local p1 = labFolder:FindFirstChild("P1")


-- Generate the path between P0 and P1
local pathFindingService = game:GetService("PathfindingService")
local path = pathFindingService:CreatePath()
path:ComputeAsync(p0.Position, p1.Position)


-- Move the NPC along the path
local waypoints = path:GetWaypoints()
for _, waypoint in ipairs(waypoints) do
	npcHumanoid:MoveTo(waypoint.Position)
	npcHumanoid.MoveToFinished:Wait()
end