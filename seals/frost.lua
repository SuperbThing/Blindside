SMODS.Seal {
    key = "frost",
    atlas = 'bld_enhance', 
    pos = { x = 3, y = 1 },
    config = { 
        extra = { 
            xchips = 1,
            xchips_mod = 0.2,
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
            return {
                xchips = (next(SMODS.find_card('j_bld_snowglobe')) and card.ability.seal.extra.xchips*2 - G.GAME.current_round.hands_played*card.ability.seal.extra.xchips_mod/2) or (card.ability.seal.extra.xchips + G.GAME.current_round.hands_played*card.ability.seal.extra.xchips_mod)
                }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (next(SMODS.find_card('j_bld_snowglobe')) and ('-X' .. tostring(card.ability.seal.extra.xchips_mod/2))) or ('X' .. tostring(card.ability.seal.extra.xchips_mod)), 
                (next(SMODS.find_card('j_bld_snowglobe')) and card.ability.seal.extra.xchips*2 - G.GAME.current_round.hands_played*card.ability.seal.extra.xchips_mod/2) or (card.ability.seal.extra.xchips + G.GAME.current_round.hands_played*card.ability.seal.extra.xchips_mod)
            }
        }
    end
}