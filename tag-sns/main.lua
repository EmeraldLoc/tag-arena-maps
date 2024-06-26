-- name: Tag - Starry Night Sky
-- description: Adds the secret level found in the mod "121rst Star" by Blo\\#0000ff\\cky\\#dcdcdc\\ into Tag!\n\nThis was developed and ported by \\#ff67ff\\Bear\\#dcdcdc\\, enjoy!

-- register the level here
LEVEL_NS = level_register('level_ns_entry', 1, 'Starry Night Sky', 'ns', 28000, 0x28, 0x28, 0x28)

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
        LEVEL_NS,
        "Starry Night Sky",
         get_texture_info("painting_sns"),
        1,
        {
            {
                { x = 347, y = -985, z = -4352 },
                { x = 2814, y = 2952, z = -6077 }
            }
        },
        { x = -452, y = -942, z = 4387 }
    )
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)

--Non Slippery Collision
---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    local np = gNetworkPlayers[0]

    if np.currLevelNum ~= LEVEL_NS then return end

    if m.floor and m.floor.type == SURFACE_DEFAULT then
        m.floor.type = SURFACE_HARD_NOT_SLIPPERY
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_MARIO_UPDATE, mario_update)
