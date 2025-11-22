SMODS.Seal {
    key = "tech",
    atlas = 'bld_enhance', 
    pos = { x = 1, y = 1 },
    config = { 
        extra = { 
            chips = 5,
            chips_mod = 5
        } 
    },
    badge_colour = HEX('757CDC'),
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    pools = {
        ["bld_obj_enhancements"] = true,
    },
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and card.facing ~= 'back' then
            SMODS.scale_card(card, {
                ref_table = card.ability.seal.extra,
                ref_value = "chips",
                scalar_value = "chips_mod",
                operation = '+',
                message_colour = G.C.BLUE
            })
            return {
                chips = card.ability.seal.extra.chips
                }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.seal.extra.chips, card.ability.seal.extra.chips_mod,
            }
        }
    end
}