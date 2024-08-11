-- Disable highlight script
local function removeHighlight(character)
    -- Find and destroy the Highlight instance
    local highlight = character:FindFirstChild("Highlight")
    if highlight then
        highlight:Destroy()
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        removeHighlight(character)
    end)
end

-- Remove highlight from all existing players
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        removeHighlight(player.Character)
    end
    player.CharacterAdded:Connect(removeHighlight)
end

-- Listen for new players joining the game
game.Players.PlayerAdded:Connect(onPlayerAdded)
