local Helpers = {config = {}}

function Helpers.IsItemAllowedForHouse(item, houseId)
    if houseId == 7 or item.race == 2147483647 or item.race == -1 then 
        return true
    elseif houseId == 2 then -- Alliance AH
        for _, race in ipairs(Helpers.config.AllowedAllyRaces) do
            if race > 0 and bit_and(item.race, race) ~= 0 then
                return true
            end
        end
    elseif houseId == 6 then -- Horde AH
        for _, race in ipairs(Helpers.config.AllowedHordeRaces) do
            if race > 0 and bit_and(item.race, race) ~= 0 then
                return true
            end
        end
    end
    return false
end

function Helpers.getQualityString(Quality)
    local QualityStrings = {
        [0] = "Gray/Poor",
        [1] = "White/Common",
        [2] = "Green/Uncommon",
        [3] = "Blue/Rare",
        [4] = "Purple/Epic",
        [5] = "Orange/Legendary",
        [6] = "Red/Artifact",
        [7] = "Gold/Heirloom"
    }
    return QualityStrings[Quality]
end

-- Like math.random(a, b) but also works correctly with floating point values.
function Helpers.randomFloatBetween(a, b)
    return a + (math.random() * (b - a))
end

return Helpers
