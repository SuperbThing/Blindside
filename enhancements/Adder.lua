    SMODS.Enhancement({
        key = 'adder',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 0},
        config = {bonus = 20,
            extra = {
                value = 1,
                hues = {"Blue"}
            }},
        replace_base_card = true,
        no_rank = true,
        no_suit = true,
        overrides_base_rank = true,
        pools = {
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true
        },
        in_pool = function(self, args)
            if G.GAME.selected_back.effect.center.config.extra then
                if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
                return true
            else
            return false
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.bonus
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
