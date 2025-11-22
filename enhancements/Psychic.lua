    SMODS.Enhancement({
        key = 'psychic',
        atlas = 'bld_blindrank',
        pos = {x = 4, y = 1},
        config = {
            extra = {
                value = 12,
                money = 2,
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
            if (context.cardarea == G.play or context.cardarea == G.hand) and context.main_scoring then
                if #context.scoring_hand == 5 then
                    return {
                        focus = card,
                        message = localize('k_tagged_ex'),
                        func = function()
                            local tag_key = get_next_tag_key()
                            while tag_key == 'tag_orbital' do
                                tag_key = get_next_tag_key()
                            end
                            add_tag(Tag(tag_key))   
                        end,
                        card = card
                    }
                else
                if card.facing ~= 'back' and context.cardarea == G.play then 
                card:flip()
                end
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.MONEY
                }
                end
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
