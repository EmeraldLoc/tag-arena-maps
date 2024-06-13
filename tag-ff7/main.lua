-- name: Tag - Gaia Overworld
-- description: Adds the FF7 overworld to Tag!\n\nThis includes Gaia West, Gaia East, and Gaia North.\n\nPorted to tag by Bear, enjoy!

-- register the level here
LEVEL_HANGOUT_GAIA_WEST = level_register('level_gaia_west_entry', COURSE_NONE, 'Gaia West Continent', 'gaia_west', 28000, 0x28, 0x28, 0x28)
LEVEL_HANGOUT_GAIA_EAST = level_register('level_gaia_east_entry', COURSE_NONE, 'Gaia East Continent', 'gaia_east', 28000, 0x28, 0x28, 0x28)
LEVEL_HANGOUT_GAIA_NORTH = level_register('level_gaia_north_entry', COURSE_NONE, 'Gaia North Continent', 'gaia_north', 28000, 0x28, 0x28, 0x28)

-- fix collision
gLevelValues.fixCollisionBugs = 1

-- make sure we don't add the level twice
local sAddedLevels = false

function on_level_init()
    -- make sure we don't add the level twice
    if sAddedLevels then return end
    sAddedLevels = true

    -- make sure Tag was loaded
    if not _G.tag then
        djui_popup_create("Tag was not found!", 2)
        return
    end

    -- add the level to tag
    _G.tag.add_level(
        LEVEL_HANGOUT_GAIA_WEST,
        "Gaia West Continent",
        get_texture_info("painting_gaia_west"),
        1,
        {
            {
                { x = 11082, y = -5516, z = 11086 },
                { x = -7786, y = -5516, z = -4441 }
            }
        }
    )
    _G.tag.add_level(
        LEVEL_HANGOUT_GAIA_EAST,
        "Gaia East Continent",
        get_texture_info("painting_gaia_east"),
        1,
        {
            {
                { x = -8864, y = -5435, z = -62 },
                { x = 5447, y = -5447, z = -4166 }
            }
        }
    )
    _G.tag.add_level(
        LEVEL_HANGOUT_GAIA_NORTH,
        "Gaia North Continent",
        get_texture_info("painting_gaia_north"),
        1,
        {
            {
                { x = -6397, y = -5470, z = 4408 },
                { x = 12753, y = -5279, z = -10864 }
            }
        }
    )
end

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    local np = gNetworkPlayers[0]

    if  np.currLevelNum ~= LEVEL_HANGOUT_GAIA_NORTH
    and np.currLevelNum ~= LEVEL_HANGOUT_GAIA_EAST
    and np.currLevelNum ~= LEVEL_HANGOUT_GAIA_WEST then return end

    if m.floor and m.floor.type == SURFACE_DEFAULT then
        m.floor.type = SURFACE_HARD_NOT_SLIPPERY
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_MARIO_UPDATE, mario_update)

local function on_warp()
    local m = gMarioStates[0]
    local np = gNetworkPlayers[0]

    if np.currLevelNum == LEVEL_HANGOUT_GAIA_EAST then
        m.pos.x = -6222
        m.pos.y = -5419
        m.pos.z = -8476
    elseif np.currLevelNum == LEVEL_HANGOUT_GAIA_NORTH then
        m.pos.x = -2832
        m.pos.y = -5462
        m.pos.z = 6545
    end
end

hook_event(HOOK_ON_WARP, on_warp)


