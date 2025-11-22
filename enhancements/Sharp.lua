    SMODS.Enhancement({
        key = 'sharp',
        atlas = 'bld_blindrank',
        pos = {x = 5, y = 0},
        config = 
            {mult = 2,
            extra = {
                value = 1,
                hues = {"Red"}
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
            ["bld_obj_blindcard_red"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.mult
                }
            }
        end
    })
    
----------------------------------------------
------------MOD CODE END----------------------
