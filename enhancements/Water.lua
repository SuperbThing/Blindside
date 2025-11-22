    SMODS.Enhancement({
        key = 'water',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 1},
        config = {
            extra = {
                value = 100,
                chips_bonus = 10,
                chips = 10,
                hues = {"Faded", "Blue"}
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
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_faded"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_burn', set = 'Other'}
            return {
                vars = {
                    card.ability.extra.chips, card.ability.extra.chips_bonus
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then   
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "chips",
                        scalar_value = "chips_bonus",
                        operation = '+',
                        message_colour = G.C.BLUE
                    })
            end
            if context.main_scoring and context.cardarea == G.play then
                return {
                    chips = card.ability.extra.chips
                }
            end
            if context.burn_card and context.cardarea == G.play and context.burn_card == card then
                return { remove = true }
            end

        end
    })
----------------------------------------------
------------MOD CODE END----------------------
