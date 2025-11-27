    SMODS.Enhancement({
        key = 'butterfly',
        atlas = 'bld_blindrank',
        pos = {x = 6, y = 8},
        config = {
            extra = {
                value = 10,
                xchips = 2,
                odds = 2,
                hues = {"Green", "Blue"}
            }
        },
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        always_scores = true,
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        weight = 3,
        pools = {
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_cool"] = true,
            ["bld_obj_blindcard_dual"] = true,
            ["bld_obj_blindcard_green"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                if SMODS.pseudorandom_probability(card, pseudoseed("butterfly"), 1, card.ability.extra.odds, 'butterfly') and card.facing ~= "back" then
                    card:flip()
                    card:flip()
                else
                    if card.facing ~= 'back' then 
                    card:flip()
                    end
                end
            end
            if context.cardarea == G.play and context.main_scoring then
                if card.facing ~= "back" then
                    return {
                        xchips = card.ability.extra.xchips
                    }
                else
                    return {
                        message = localize('k_nope_ex'),
                        colour = G.C.GREEN
                    }
                end
            end
        end,
        loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'bld_self_scoring', set = 'Other'}
            local chance, trigger = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'flip')
            return {
                vars = {
                    card.ability.extra.xchips,
                    chance,
                    trigger
                }
            }
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
