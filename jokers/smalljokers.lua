SMODS.Blind({
    key = 'lustyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=2},
    boss_colour = G.C.RED,
    mult = 3,
    dollars = 4,
    order = 2,
    small = {min = 1},
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled then
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Red") and context.scoring_hand[i].facing ~= "back" then
                    changed = true
                end
            end
            if changed then
            BLINDSIDE.chipsmodify(2, 0, 0)
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})



SMODS.Blind({
    key = 'greedyjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=1},
    boss_colour = G.C.MONEY,
    mult = 3,
    dollars = 4,
    order = 3,
    small = {min = 1},
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled then
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Yellow") and context.scoring_hand[i].facing ~= "back" then
                    changed = true
                end
            end
            if changed then
                BLINDSIDE.chipsmodify(2, 0, 0)
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})



SMODS.Blind({
    key = 'wrathfuljoker',
    atlas = 'bld_joker',
    pos = {x=0, y=3},
    boss_colour = G.C.PURPLE,
    mult = 3,
    dollars = 4,
    order = 4,
    small = {min = 1},
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled then
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Purple") and context.scoring_hand[i].facing ~= "back" then
                    changed = true
                end
            end
            if changed then
                BLINDSIDE.chipsmodify(2, 0, 0)
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})

SMODS.Blind({
    key = 'gluttonousjoker',
    atlas = 'bld_joker',
    pos = {x=0, y=4},
    boss_colour = G.C.GREEN,
    mult = 3,
    dollars = 4,
    order = 5,
    small = {min = 1},
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled then
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Green") and context.scoring_hand[i].facing ~= "back" then
                    changed = true
                end
            end
            if changed then
                BLINDSIDE.chipsmodify(2, 0, 0)
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})

SMODS.Blind({
    key = 'slothfuljoker',
    atlas = 'bld_joker',
    pos = {x=0, y=5},
    boss_colour = G.C.CHIPS,
    mult = 3,
    dollars = 4,
    small = {min = 1},
    order = 6,
    set_blind = function(self)
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
    in_pool = function(self, args)
        if G.GAME.selected_back.effect.center.config.extra then
            if not G.GAME.selected_back.effect.center.config.extra.blindside then return false end
            return true
        else
        return false
        end
    end,
    calculate = function(self, blind, context)
        if context.after and not G.GAME.blind.disabled then
            local changed = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_color("Blue") and context.scoring_hand[i].facing ~= "back" then
                    changed = true
                end
            end
            if changed then
                BLINDSIDE.chipsmodify(2, 0, 0)
            end
        end
    end,
    load = function()
        G.GAME.blindassist.states.visible = false
        G.GAME.blindassist:change_dim(0,0)
    end,
})