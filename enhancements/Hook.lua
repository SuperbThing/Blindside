    SMODS.Enhancement({
        key = 'hook',
        atlas = 'bld_blindrank',
        pos = {x = 9, y = 0},
        config = {
            mult = 5,
            extra = {
                discards = 1,
                value = 10,
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
            ["bld_obj_blindcard_generate"] = true,
            ["bld_obj_blindcard_warm"] = true,
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_red"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                    ease_discard(card.ability.extra.discards)
                end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.mult, card.ability.extra.discards
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
