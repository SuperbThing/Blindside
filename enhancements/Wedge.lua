    SMODS.Enhancement({
        key = 'wedge',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 3},
        config = {
            extra = {
                value = 14,
                hues = {"Green"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        always_scores = true,
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_green"] = true,
        },
        calculate = function(self, card, context) 
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.mult
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
