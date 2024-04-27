-- name: Tag - \\#FFCC00\\McDonald's\\#FFFFFF\\
-- description: This mod adds a custom McDonald's map to tag!\n\nMap by chillyzone\nTag Port by EmeraldLockdown

-- register the level here
local inited = false
LEVEL_HANGOUT_MCDONALDS = 100
level_register('level_hangout_mcdonalds_entry', COURSE_NONE, 'McDonalds', 'hangout_mcdonalds', 28000, 0x08, 0x08, 0x08)
local level_hangout_mcdonalds = smlua_level_util_get_info_from_short_name('hangout_mcdonalds')
level_hangout_mcdonalds.levelNum = LEVEL_HANGOUT_MCDONALDS
E_MODEL_MCDONALDCRATE = smlua_model_util_get_id("mcd_crate_geo")

function mcdinit()
    if not inited then
        inited = true

        if not _G.tag then
            djui_popup_create("Tag Is Not Loaded", 1)
            return
        end

        _G.tag.add_level(LEVEL_HANGOUT_MCDONALDS, "McDonalds", get_texture_info("painting_mcdonalds"), 1, nil, { x = 3042, y = 132, z = 485 })
    end
end

hook_event(HOOK_ON_LEVEL_INIT, mcdinit)
