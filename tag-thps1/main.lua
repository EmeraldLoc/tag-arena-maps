-- name: Tag - THPS Warehouse
-- description: This ads the THPS1 Warehouse to Tag!\n\nMap originally ported by BuckleyTim.\n\nPorted to tag by Bear, enjoy

local audioToPlay = audio_stream_load("64_Superman.ogg")

-- use fixed collisions
gLevelValues.fixCollisionBugs = 1

-- register level
LEVEL_ARENA_WAREHOUSE = 105
level_register('level_warehouseA_entry', COURSE_NONE, "Warehouse", 'warehouse', 28000, 0x28, 0x28, 0x28)
local level_arena_warehouse = smlua_level_util_get_info_from_short_name('warehouse')
level_arena_warehouse.levelNum = LEVEL_ARENA_WAREHOUSE

-- make sure we don't add the level twice
local addedLevels = false

local function on_level_init()
    -- make sure we don't add the level twice
    if addedLevels then return end
    addedLevels = true

    -- make sure Arena was loaded
    if not _G.tag then
        djui_popup_create("Tag was not found!", 2)
        return
    end

    -- add the level to tag
    _G.tag.add_level(LEVEL_ARENA_WAREHOUSE, "Warehouse", get_texture_info("painting_warehouse"), 1, nil, nil)
end

-----
--audio stuff
-----

function on_warp()
    if gNetworkPlayers[0].currLevelNum == 105 then
        stop_background_music(get_current_background_music())
        audio_stream_stop(audioToPlay)

        audio_stream_destroy(audioToPlay)
        audioToPlay = audio_stream_load("64_Superman.ogg")
        audio_stream_set_looping(audioToPlay, true)
        audio_stream_play(audioToPlay, true, 1)
    else
        audio_stream_stop(audioToPlay)
    end
end

-- disable cap music
-- this code taken from the arena dx mod
function music()
    local np = gNetworkPlayers[0]
    if np.currLevelNum == 105 then
        stop_cap_music()
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)

hook_event(HOOK_UPDATE, music)
hook_event(HOOK_ON_WARP, on_warp)

--Non Slippery Collision
---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    local np = gNetworkPlayers[0]

    if np.currLevelNum ~= LEVEL_ARENA_WAREHOUSE then return end

    if m.floor and m.floor.type == SURFACE_DEFAULT then
        m.floor.type = SURFACE_HARD_NOT_SLIPPERY
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_MARIO_UPDATE, mario_update)
