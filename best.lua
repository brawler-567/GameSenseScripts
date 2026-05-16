local base64 = require("gamesense/base64")
local clipboard = require("gamesense/clipboard")
local weapons = require("gamesense/csgo_weapons")

-- refs
local ref = {
    qp = {ui.reference("RAGE", "Other", "Quick peek assist")},
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    air = ui.reference("MISC", "Movement", "Air strafe"),

    yaw_base = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw"),
    yaw_offset = select(2, ui.reference("AA", "Anti-aimbot angles", "Yaw")),

    bodyyaw = {
        ui.reference(
            "AA",
            "Anti-aimbot angles",
            "Body yaw"
        )
    },

    fsby = ui.reference(
        "AA",
        "Anti-aimbot angles",
        "Freestanding body yaw"
    ),
}

-- menu

local menu = {
    tab = ui.new_combobox("LUA", "A", "Melancholia.ws", {
        "Home", "Rage", "Anti-Aim", "Visual", "Misc"
    }),

    home = {
        label = ui.new_label("LUA", "A", "Config"),
        cfg = ui.new_textbox("LUA", "A", "Config name")
    },

    rage = {
        discharge = ui.new_checkbox("LUA", "A", "Auto discharge"),
        mode = ui.new_combobox("LUA", "A", "Mode", {"Instant", "Ideal"})
    },

    aa = {
        peek = ui.new_checkbox("LUA", "A", "Defensive peek"),
        predict = ui.new_slider("LUA", "A", "Prediction", 8, 32, 24),
    },

    visual = {
        arrows = ui.new_checkbox("LUA", "A", "Manual arrows"),

        l_text = ui.new_label("LUA", "A", "Left"),
        left = ui.new_hotkey("LUA", "A", "\nleft", true),

        r_text = ui.new_label("LUA", "A", "Right"),
        right = ui.new_hotkey("LUA", "A", "\nright", true),

        notify = ui.new_multiselect("LUA", "A", "Notifications", {
            "Hit", "Miss", "Shot", "Reset", "Buy"
        })
    },

    misc = {
        jumpscout = ui.new_checkbox("LUA", "A", "Jumpscout"),
        clantag = ui.new_checkbox("LUA", "A", "Clan tag"),
        ladder = ui.new_checkbox("LUA", "A", "Fast ladder"),
        
        -- Buy bot
        buy_bot_enabled = ui.new_checkbox("LUA", "A", "Enable buy bot"),
        buy_bot_primary = ui.new_combobox("LUA", "A", "Primary weapon", {
            "None", "Autosnipers", "Scout", "AWP", "AK-47 / M4",  
            "AUG / SG553", "Famas", "Negev", "M249", "MP7 / MP5", 
            "MP9 / Mac-10", "UMP-45", "P90", "Bizon", "Nova", 
            "XM1014", "Mag7 / Sawed-Off"
        }),
        buy_bot_secondary = ui.new_combobox("LUA", "A", "Secondary weapon", {
            "None", "R8 / Deagle", "Tec-9 / Five-S / CZ-75", "P-250", "Duals"
        }),
        buy_bot_utility = ui.new_multiselect("LUA", "A", "Utility items", {
            "Kevlar", "Helmet", "Defuser", "Taser", "HE", "Molotov", 
            "Smoke", "Flashbang", "Decoy"
        })
    }
}

-- helpers

local function contains(t,v)
    for i=1,#t do
        if t[i] == v then
            return true
        end
    end
end

local function visible(state, tbl)

    state = state == true

    for _, v in pairs(tbl) do

        if v ~= nil then
            ui.set_visible(v, state)
        end
    end
end

local function get_cfg()

    local data = {}

    for cat, tbl in pairs(menu) do

        if type(tbl) == "table" then

            data[cat] = {}

            for k,v in pairs(tbl) do

                local ok,val = pcall(ui.get, v)

                if ok then
                    data[cat][k] = val
                end
            end
        end
    end

    return data
end

local function load_cfg(data)

    for cat,tbl in pairs(data) do

        if menu[cat] then

            for k,v in pairs(tbl) do

                if menu[cat][k] then
                    pcall(ui.set, menu[cat][k], v)
                end
            end
        end
    end
end

-- notifications

local notifications = {}
local last_shot = 0

local function notify(text)

    table.insert(notifications, 1, {
        text = text,
        alpha = 0,
        y = 0,
        life = globals.realtime() + 4
    })
end

client.set_event_callback("paint", function()

    local sw, sh = client.screen_size()

    for i=#notifications,1,-1 do

        local n = notifications[i]

        n.alpha = globals.realtime() > n.life
        and math.max(n.alpha - 7, 0)
        or math.min(n.alpha + 15, 255)

        if n.alpha <= 0 then

            table.remove(notifications, i)

        else

            n.y = n.y + (((i-1)*26)-n.y)*0.08

            local w = renderer.measure_text("", n.text)

            local x = sw/2 - (w+30)/2
            local y = sh/2 + 180 + n.y

            renderer.rectangle(x,y,w+30,22,35,35,35,n.alpha)

            renderer.text(
                x+10,y+4,
                179,255,18,n.alpha,
                "",0,"L"
            )

            renderer.text(
                x+22,y+4,
                255,255,255,n.alpha,
                "",0,n.text
            )
        end
    end
end)

-- config buttons

menu.home.save = ui.new_button("LUA","A","Save",function()

    local name = ui.get(menu.home.cfg)

    if name == "" then
        notify("Enter config name")
        return
    end

    database.write(
        "melancholia_"..name,
        base64.encode(json.stringify(get_cfg()))
    )

    notify("Saved "..name)

end)

menu.home.load = ui.new_button("LUA","A","Load",function()

    local name = ui.get(menu.home.cfg)

    local raw = database.read("melancholia_"..name)

    if not raw then
        notify("Config not found")
        return
    end

    load_cfg(
        json.parse(base64.decode(raw))
    )

    notify("Loaded "..name)

end)

menu.home.export = ui.new_button("LUA","A","Export",function()

    clipboard.set(
        base64.encode(
            json.stringify(get_cfg())
        )
    )

    notify("Exported config")

end)

menu.home.import = ui.new_button("LUA","A","Import",function()

    local ok,data = pcall(function()

        return json.parse(
            base64.decode(
                clipboard.get()
            )
        )

    end)

    if not ok then
        notify("Invalid config")
        return
    end

    load_cfg(data)

    notify("Imported config")

end)

-- defensive peek

local hitboxes = {0,2,3}

local function can_fire()

    local lp = entity.get_local_player()
    local wpn = lp and entity.get_player_weapon(lp)

    if not wpn then
        return false
    end

    return entity.get_prop(
        wpn,
        "m_flNextPrimaryAttack"
    ) <= globals.curtime()
end

local function will_peek()
    local lp = entity.get_local_player()
    if not lp or not can_fire() then
        return false
    end

    local ex,ey,ez = client.eye_position()

    local vx,vy,vz = entity.get_prop(lp,"m_vecVelocity")

    local t = globals.tickinterval()*ui.get(menu.aa.predict)

    ex,ey,ez = ex+vx*t, ey+vy*t, ez+vz*t

    for _,enemy in pairs(entity.get_players(true)) do

        if entity.is_alive(enemy) then

            local evx,evy,evz =
                entity.get_prop(enemy,"m_vecVelocity")

            for _,hb in pairs(hitboxes) do

                local x,y,z =
                    entity.hitbox_position(enemy,hb)

                x,y,z =
                    x+evx*t,
                    y+evy*t,
                    z+evz*t

                local _,dmg =
                    client.trace_bullet(
                        lp,ex,ey,ez,x,y,z
                    )

                if dmg > 0 then
                    return true
                end
            end
        end
    end

    return false
end

-- manuals

local side, delay = 0, 0
local backup = {}

local function update_manuals()

    if not ui.get(menu.visual.arrows) then
        side = 0
        return
    end

    local tick = globals.tickcount()

    if ui.get(menu.visual.left) and delay < tick then
        side = side == -90 and 0 or -90
        delay = tick + 10
    end

    if ui.get(menu.visual.right) and delay < tick then
        side = side == 90 and 0 or 90
        delay = tick + 10
    end
end

-- clantag

local tag = "Melancholia.ws"
local prev = ""
local start = 0
local enabled = false

local function update_tag()

    if not ui.get(menu.misc.clantag) then

        if enabled then
            client.set_clan_tag("")
            enabled = false
            prev = ""
        end

        return
    end

    if not enabled then
        enabled = true
        start = globals.curtime()
    end

    local len = #tag
    local step =
        math.floor(
            (globals.curtime()-start)/0.25
        ) % ((len*2)+1)

    local text =
        step == 0 and " "
        or step <= len
        and tag:sub(1,step)
        or tag:sub(1,len-(step-len))

    if text ~= prev then
        client.set_clan_tag(text)
        prev = text
    end
end

-- paint

client.set_event_callback("paint", function()

    update_tag()

    if ui.get(menu.visual.arrows) then

        local sw,sh = client.screen_size()

        sw,sh = sw/2, sh/2

        renderer.text(
            sw-50,sh,
            255,255,255,
            side == -90 and 255 or 70,
            "c+",0,"<"
        )

        renderer.text(
            sw+50,sh,
            255,255,255,
            side == 90 and 255 or 70,
            "c+",0,">"
        )
    end
end)

-- notifications

client.set_event_callback("aim_hit", function(e)

    if contains(ui.get(menu.visual.notify),"Hit") then
        notify(
            "Hit "..entity.get_player_name(e.target)
            .." for "..e.damage
        )
    end
end)

client.set_event_callback("aim_miss", function(e)

    if contains(ui.get(menu.visual.notify),"Miss") then
        notify(
            "Missed "..entity.get_player_name(e.target)
        )
    end
end)

client.set_event_callback("bullet_impact", function(e)

    if not contains(ui.get(menu.visual.notify),"Shot") then
        return
    end

    local shooter =
        client.userid_to_entindex(e.userid)

    if not entity.is_enemy(shooter) then
        return
    end

    if globals.curtime()-last_shot < 0.5 then
        return
    end

    last_shot = globals.curtime()

    notify("Enemy shot detected")
end)

client.set_event_callback("round_start", function()

    if contains(ui.get(menu.visual.notify),"Reset") then
        notify("Round restarted")
    end
end)

-- buy bot

local primary_console = {
    ["Autosnipers"] = "scar20",
    ["Scout"] = "ssg08",
    ["AWP"] = "awp",
    ["AK-47 / M4"]  = "ak47",
    ["AUG / SG553"] = "sg556",
    ['Famas'] = 'famas',
    ["Negev"] = "negev",
    ['M249'] = 'm249',
    ['MP7 / MP5'] = 'mp7',
    ['MP9 / Mac-10'] = 'mp9',
    ['UMP-45'] = 'ump45',
    ['P90'] = 'p90',
    ['Bizon'] = 'bizon',
    ['Nova'] = 'nova',
    ['XM1014'] = 'XM1014',
    ['Mag7 / Sawed-Off'] = 'mag7'
}

local secondary_console = {
    ["R8 / Deagle"] = "deagle",
    ["Tec-9 / Five-S / CZ-75"] = "tec9",
    ["P-250"] = "p250",
    ["Duals"] = "elite"
}

local utility_console = {
    ["Kevlar"] = "vest",
    ['Helmet'] = 'vesthelm',
    ["Defuser"] = "defuser",
    ["Taser"] = "taser",
    ["HE"] = "hegrenade",
    ["Molotov"] = "molotov",
    ["Smoke"] = "smokegrenade",
    ["Flashbang"] = "flashbang",
    ["Decoy"] = "decoy"
}

client.set_event_callback("round_prestart", function()
    -- Проверяем, включен ли бай-бот
    if not ui.get(menu.misc.buy_bot_enabled) then
        return
    end

    -- Проверяем деньги
    local money = entity.get_prop(entity.get_local_player(), "m_iAccount") or 0
    if money <= 800 then
        return
    end

    local primary = ui.get(menu.misc.buy_bot_primary)
    local secondary = ui.get(menu.misc.buy_bot_secondary)
    local util = ui.get(menu.misc.buy_bot_utility)

    -- 1. Сначала покупаем основное оружие
    if primary ~= 'None' and primary_console[primary] then
        client.exec("buy " .. primary_console[primary])
    end

    -- 2. Затем покупаем пистолет
    if secondary ~= 'None' and secondary_console[secondary] then
        client.exec("buy " .. secondary_console[secondary])
    end

    -- 3. В конце по очереди покупаем гранаты и броню
    for i = 1, #util do
        local item = utility_console[util[i]]
        if item then
            client.exec("buy " .. item)
        end
    end

    -- Уведомление в чат/экран (если включено в меню)
    if contains(ui.get(menu.visual.notify), "Buy") and primary ~= 'None' then
        notify("Bought " .. primary)
    end
end)

-- visibility

client.set_event_callback("paint_ui", function()

    local t = ui.get(menu.tab)
    -- home
    visible(t=="Home", {
        menu.home.label,
        menu.home.cfg,
        menu.home.save,
        menu.home.load,
        menu.home.export,
        menu.home.import
    })

    -- rage

    visible(t=="Rage", {
        menu.rage.discharge
    })

    ui.set_visible(
        menu.rage.mode,
        t=="Rage"
        and ui.get(menu.rage.discharge)
    )

    -- anti-aim

    visible(t=="Anti-Aim", {
        menu.aa.peek,
    })

    ui.set_visible(
        menu.aa.predict,
        t=="Anti-Aim"
        and ui.get(menu.aa.peek)
    )

    -- visual

    visible(t=="Visual", {
        menu.visual.arrows,
        menu.visual.notify
    })

    visible(
        t=="Visual" and ui.get(menu.visual.arrows),
        {
            menu.visual.l_text,
            menu.visual.left,
            menu.visual.r_text,
            menu.visual.right
        }
    )

    -- misc

    visible(t=="Misc", {
        menu.misc.jumpscout,
        menu.misc.clantag,
        menu.misc.ladder,
        menu.misc.buy_bot_enabled,
        menu.misc.buy_bot_primary,
        menu.misc.buy_bot_secondary,
        menu.misc.buy_bot_utility
    })

    -- buy bot visibility (only show when enabled)
    visible(
        t=="Misc" and ui.get(menu.misc.buy_bot_enabled),
        {
            menu.misc.buy_bot_primary,
            menu.misc.buy_bot_secondary,
            menu.misc.buy_bot_utility
        }
    )
end)

-- setup_command

client.set_event_callback("setup_command", function(cmd)

    update_manuals()

    -- discharge

    if ui.get(menu.rage.discharge)
    and not ui.get(ref.qp[2])
    and ui.get(ref.dt[2]) then

        local wpn =
            entity.get_classname(
                entity.get_player_weapon(
                    entity.get_local_player()
                )
            )

        if wpn == "CWeaponSSG08"
        or wpn == "CWeaponAWP" then

            local z =
                math.floor(
                    entity.get_prop(
                        entity.get_local_player(),
                        "m_vecVelocity[2]"
                    )
                )

            local vulnerable = false

            for _,v in ipairs(entity.get_players(true)) do

                local flags =
                    entity.get_esp_data(v).flags

                if bit.band(flags, bit.lshift(1,11)) ~= 0 then
                    vulnerable = true
                end
            end

            if vulnerable then

                if ui.get(menu.rage.mode) == "Ideal"
                and z > 20 then
                    return
                end

                cmd.in_jump = false
                cmd.discharge_pending = true
            end
        end
    end

    -- defensive

    if ui.get(menu.aa.peek)
    and ui.get(ref.dt[1])
    and ui.get(ref.dt[2]) then

        cmd.force_defensive = will_peek()
    end

    -- jumpscout

    if ui.get(menu.misc.jumpscout) then

        local x,y =
            entity.get_prop(
                entity.get_local_player(),
                "m_vecVelocity"
            )

        ui.set(
            ref.air,
            not (
                cmd.in_jump
                and math.sqrt(x^2+y^2) < 10
            )
            or ui.is_menu_open()
        )
    end

    -- fast ladder

    if ui.get(menu.misc.ladder) then

        local lp = entity.get_local_player()
        if lp and entity.get_prop(lp,"m_MoveType") == 9 then

            cmd.yaw = math.floor(cmd.yaw+0.5)

            if cmd.forwardmove ~= 0 then

                cmd.pitch = 89

                local back = cmd.forwardmove > 0

                cmd.in_forward = back and 0 or 1
                cmd.in_back = back and 1 or 0

                cmd.in_moveleft = back and 0 or 1
                cmd.in_moveright = back and 1 or 0

                cmd.yaw =
                    cmd.yaw +
                    (
                        cmd.sidemove == 0 and 90
                        or cmd.sidemove > 0 and 30
                        or 150
                    )
            end
        end
    end

    -- manuals

    if side ~= 0 then

        if not backup.active then

            backup.base = ui.get(ref.yaw_base)
            backup.yaw = ui.get(ref.yaw)
            backup.offset = ui.get(ref.yaw_offset)

            backup.active = true
        end

        ui.set(ref.yaw_base,"Local view")
        ui.set(ref.yaw,"180")
        ui.set(ref.yaw_offset,side)

    elseif backup.active then

        ui.set(ref.yaw_base,backup.base)
        ui.set(ref.yaw,backup.yaw)
        ui.set(ref.yaw_offset,backup.offset)

        backup.active = false
    end
end)

client.set_event_callback("shutdown", function()
    client.set_clan_tag("")
end)