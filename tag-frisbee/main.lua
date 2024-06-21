-- name: Tag - WSR Frisbee Dog Island
-- description: Adds the Frisbee Dog Island seen in Wii Sports Resort!\n\nPorted to tag by Saus, with extra help from Bear.\n\nEnjoy!

-- register level
LEVEL_FRISBEE = level_register('level_frisbee_entry', COURSE_NONE, "Frisbee Island", 'frisbee', 28000, 0x28, 0x28, 0x28)

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
    _G.tag.add_level(LEVEL_FRISBEE, "Frisbee Island", get_texture_info("painting_frisbee"), 1, nil, nil)
end

local function on_warp()
    local m = gMarioStates[0]

    if gNetworkPlayers[0].currLevelNum == LEVEL_FRISBEE then
        m.pos.x = 0
        m.pos.y = 25
        m.pos.z = 60
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_ON_WARP, on_warp)

--Non Slippery Collision
---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    local np = gNetworkPlayers[0]

    if np.currLevelNum ~= LEVEL_FRISBEE then return end

    if m.floor and m.floor.type == SURFACE_DEFAULT then
        m.floor.type = SURFACE_HARD_NOT_SLIPPERY
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_MARIO_UPDATE, mario_update)