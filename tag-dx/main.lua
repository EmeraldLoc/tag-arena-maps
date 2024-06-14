-- name: Tag - DX Stages
-- description: Adds the SM64 Coop Deluxe Arena stages to Tag!\n\nThis includes Rainbow Road (PEAK), Space, and City.\n\nPorted to tag by Bear, enjoy!

-- register the level here
LEVEL_ARENA_RAINBOW = level_register('level_arena_rainbow_entry', COURSE_NONE, 'Rainbow Road', 'rainbow', 28000, 0x28, 0x28, 0x28)
LEVEL_ARENA_SPACE = level_register('level_arena_space_entry', COURSE_NONE, 'Space Central', 'space', 28000, 0x28, 0x28, 0x28)
LEVEL_ARENA_CITY = level_register('level_arena_city_entry', COURSE_NONE, 'Blimp City', 'city', 28000, 0x28, 0x28, 0x28)

-- make sure we don't add the level twice
local sAddedLevels = false

function on_level_init()
    -- make sure we don't add the level twice
    if sAddedLevels then return end
    sAddedLevels = true

    -- make sure Arena was loaded
    if not _G.tag then
        djui_popup_create("Tag was not found!", 2)
        return
    end
-- fix collision
gLevelValues.fixCollisionBugs = 1

    -- add the level to tag
    _G.tag.add_level(LEVEL_ARENA_RAINBOW, "Rainbow Road", get_texture_info("painting_rainbow"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_SPACE, "Space Central", get_texture_info("painting_space"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_CITY, "Blimp City", get_texture_info("painting_city"), 1, nil, nil)
end

--Scrolling Stars
add_scroll_target(0, "arena_rainbow_dl_Bridge_mesh_layer_5_vtx_0", 0, 5523)

--Non Slippery Collision
---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    local np = gNetworkPlayers[0]

    if np.currLevelNum ~= LEVEL_ARENA_SPACE then return end

    if m.floor and m.floor.type == SURFACE_DEFAULT then
        m.floor.type = SURFACE_HARD_NOT_SLIPPERY
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_MARIO_UPDATE, mario_update)
