    SMODS.Enhancement({
        key = 'house',
        atlas = 'bld_blindrank',
        pos = {x = 2, y = 0},
        config = {
            extra = {
                value = 11,
                chips = 40,
                cards_to_hand = {},
                flipped = true,
                hues = {"Blue"}
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
            ["bld_obj_blindcard_single"] = true,
            ["bld_obj_blindcard_blue"] = true,
        },
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.chips
                }
            }
        end,
        calculate = function(self, card, context)
            if context.cardarea == G.play and context.main_scoring then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end,
    })
----------------------------------------------
------------MOD CODE END----------------------
