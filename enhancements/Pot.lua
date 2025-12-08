    SMODS.Enhancement({
        key = 'pot',
        atlas = 'bld_blindrank',
        pos = {x = 7, y = 2},
        config = {
            extra = {
                money = 1,
                value = 1,
                hues = {"Yellow"},
            upgrade = {
                money = 2,
                value = 1,
                hues = {"Yellow"},
                upgraded = true
            }
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_yellow"] = true,
        },
        calculate = function(self, card, context)
            if (context.cardarea == G.hand or context.cardarea == G.play) and context.main_scoring then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.money
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
