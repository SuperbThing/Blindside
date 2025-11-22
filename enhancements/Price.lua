    SMODS.Enhancement({
        key = 'price',
        atlas = 'bld_blindrank',
        pos = {x = 8, y = 3},
        config = {
            extra = {
                value = 10,
                mult = 0,
                mult_mod = 2,
                cost = 1,
                hues = {"Yellow"}
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
            ["bld_obj_blindcard_yellow"] = true,
        },
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.before and card.facing ~= 'back' then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_mod",
                    operation = '+',
                    message_colour = G.C.RED
                })
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    mult = card.ability.extra.mult,
                    p_dollars = -card.ability.extra.cost,
                }
            end
        end,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.cost
                }
            }
        end
    })
----------------------------------------------
------------MOD CODE END----------------------
