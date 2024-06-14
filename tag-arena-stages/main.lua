-- name: Tag - Arena Stages

-- register levels
LEVEL_ARENA_ORIGIN    = level_register('level_arena_origin_entry',    COURSE_NONE, 'Origin',    'origin',    28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_SKY_BEACH = level_register('level_arena_sky_beach_entry', COURSE_NONE, 'Sky Beach', 'beach',     28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_PILLARS   = level_register('level_arena_pillars_entry',   COURSE_NONE, 'Pillars',   'pillars',   28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_FORTS     = level_register('level_arena_forts_entry',     COURSE_NONE, 'Forts',     'forts',     28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_CITADEL   = level_register('level_arena_citadel_entry',   COURSE_NONE, 'Citadel',   'citadel',   28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_SPIRE     = level_register('level_arena_spire_entry',     COURSE_NONE, 'Spire',     'spire',     28000, 0x08, 0x08, 0x08)
LEVEL_ARENA_PLATFORMS = level_register('level_arena_platforms_entry',     COURSE_NONE, 'Platforms',     'platforms', 28000, 0x08, 0x08, 0x08)

local addedLevels = false

function on_level_init()
    -- make sure we don't add the level twice
    if addedLevels then return end
    addedLevels = true

    -- make sure Arena's loaded
    if not _G.tag then
        djui_popup_create("Tag Is Not Loaded", 1)
        return
    end

    _G.tag.add_level(LEVEL_ARENA_ORIGIN, "Origin", get_texture_info("painting_origin"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_SKY_BEACH, "Sky Beach", get_texture_info("painting_sky_beach"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_PILLARS, "Pillars", get_texture_info("painting_pillars"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_FORTS, "Forts", get_texture_info("painting_forts"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_CITADEL, "Citadel", get_texture_info("painting_citadel"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_SPIRE, "Spire", get_texture_info("painting_spire"), 1, nil, nil)
    _G.tag.add_level(LEVEL_ARENA_PLATFORMS, "Platforms", get_texture_info("painting_platforms"), 1, nil, nil)
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
