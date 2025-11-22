    SMODS.Enhancement({
        key = 'bolt',
        atlas = 'bld_blindrank',
        pos = {x = 3, y = 8},
        config = {
            extra = {
                value = 100,
                hues = {"Purple", "Yellow"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_purple"] = true,
            ["bld_obj_blindcard_yellow"] = true,
        },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_TAGS['tag_bld_debuff']
    end,
        weight = 3,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                G.bolt_played_hand = context.scoring_name
                add_tag(Tag('tag_bld_debuff'))
                return {
                    card = card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
