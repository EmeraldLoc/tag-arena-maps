-- name: Tag - Castle Gallery/HELLP
-- description: This adds the Arena HELLP stage by Chilly into Tag.\n\nIt is instead named "Castle Gallery" to fit the stage better.\n\nPorted to tag by Bear, enjoy!

-- register the level here
LEVEL_ARENA_HELLP = level_register('level_arena_hellp_entry', COURSE_NONE, 'Castle Gallery', 'arena_hellp', 28000, 0x28, 0x28, 0x28)

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

    -- add the level to tag
    _G.tag.add_level(LEVEL_ARENA_HELLP, "Castle Gallery", get_texture_info("painting_hellp"), 1, nil, nil)
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
