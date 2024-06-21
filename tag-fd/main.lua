-- name: Tag - Final Destination
-- description: This adds the Final Destination level from Smash 64!\n\nPorted to tag by Bear, enjoy!

-- register level
LEVEL_FINAL_DESTINATION = level_register('level_final_destination_entry', COURSE_NONE, "Final Destination", 'final_destination', 28000, 0x28, 0x28, 0x28)

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
    _G.tag.add_level(LEVEL_FINAL_DESTINATION, "Final Destination", get_texture_info("painting_fd"), 1, nil, nil)
end

local function on_warp()
    local m = gMarioStates[0]

    if gNetworkPlayers[0].currLevelNum == LEVEL_FINAL_DESTINATION then
        m.pos.x = 0
        m.pos.y = 4592
        m.pos.z = 58
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
hook_event(HOOK_ON_WARP, on_warp)