-- name: Tag - Bitforts
-- description: Adds a Super Mario Bros. 1 themed level into Tag!\n\nMap by chillyzone\nSpecial thanks to flipflopbell for their 3D Skybox Template :)

-- register the level here
LEVEL_ARENA_RETRO = level_register('level_arena_retro_entry', COURSE_NONE, 'Bitforts', 'arena_retro', 28000, 0x08, 0x08, 0x08)

----------------------------
--     Skybox       ---
----------------------------
E_MODEL_RETROSKY = smlua_model_util_get_id("retro_skybox")

-- Behavior
local l = gLakituState

function bhv_skybox_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
    obj_scale(o, 10.0)
end

function bhv_skybox_loop(o)
    o.oPosX = l.pos.x
    o.oPosY = l.pos.y
    o.oPosZ = l.pos.z
end

id_bhv3DSkybox = hook_behavior(bhv3DSkybox, OBJ_LIST_LEVEL, false, bhv_skybox_init, bhv_skybox_loop)

function SpawnSkybox()
    local skyboxcheck = obj_get_nearest_object_with_behavior_id(o, id_bhv3DSkybox)
    local p = gNetworkPlayers[0]
    if skyboxcheck == nil and p.currLevelNum == LEVEL_ARENA_RETRO then
        spawn_non_sync_object(id_bhv3DSkybox, E_MODEL_RETROSKY, l.pos.x, l.pos.y, l.pos.z, nil)
    end
end

-- make sure we don't add the level twice
local sAddedLevels = false

function on_level_init()
    SpawnSkybox()
    -- make sure we don't add the level twice
    if sAddedLevels then return end
    sAddedLevels = true

    -- make sure Tag is loaded
    if not _G.tag then
        djui_popup_create("Tag Is Not Loaded", 1)
        return
    end

    -- add the level to tag
    _G.tag.add_level(LEVEL_ARENA_RETRO, "Bitforts", get_texture_info("painting_bitforts"), 1, nil, nil)
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
