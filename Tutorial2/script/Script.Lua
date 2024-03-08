-- Level: basic
-- This code displays parts from point P0 to P1

-- Get elements from the workspace
------- Wait for 3 seconds, so all the elements are loadded in the workspace++
wait(3)

local workspaceService = game:GetService("Workspace")
local labFolder = workspaceService:FindFirstChild("Lab")

-------Get P0 and P1 points
local p0 = labFolder:FindFirstChild("P0")
p0.CanCollide = false
p0.Transparency = .5;
p0.Anchored = true
local p1 = labFolder:FindFirstChild("P1")
p1.CanCollide = false
p1.Transparency = .5;
p1.Anchored = true

------- Get Small box indicator
local indicatorsFolder = labFolder:FindFirstChild("Indicators")
local smallBox = indicatorsFolder:FindFirstChild("SmallBox")
smallBox.Transparency = 1;

-- Create the path using pathFindingService
local pathFindingService = game:GetService("PathfindingService")
local path = pathFindingService:CreatePath()
path:ComputeAsync(p0.Position, p1.Position)
local waypoints = path:GetWaypoints()

-- Display the Loop through waypoints to create indicators
for index, waypoint in ipairs(waypoints) do	
	local clonedIndicator = smallBox:Clone()
	clonedIndicator.Transparency = 0	
	clonedIndicator.Name = "SmallBox" .. index
	clonedIndicator.Parent = indicatorsFolder
	clonedIndicator.CanCollide = false
	clonedIndicator.Anchored = true
	clonedIndicator.CFrame = CFrame.new(waypoint.Position)
	wait(0.15)
end
