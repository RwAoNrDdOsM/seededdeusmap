local mod = get_mod("seededdeusmap")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de
mod:hook(DeusMechanism, "game_round_ended", function (func, self, t, dt, reason, reason_data)
    if mod.seed ~= script_data.deus_seed then
        script_data.deus_seed = tonumber(mod.seed)
    end

    func(self, t, dt, reason, reason_data)
end)

mod:command("deusmap_seed", mod:localize("deusmap_seed_command_description"), function(x) 
    local type = type(x)
    if type == "number" then
        mod.seed = tonumber(x)
        mod:chat_broadcast("Holseher’s Map Seed set to: " .. tostring(x))
    elseif type == "string" then
        local num = tonumber(string.sub(Application.make_hash(mod.seed), 1, 8), 16)
        mod.seed = tonumber(num)
        --mod:chat_broadcast("Seed set to: " .. tostring(num))
        mod:chat_broadcast("Holseher’s Map Seed set to: " .. tostring(x))
    else
        mod:chat_broadcast("Please input a number, a word, or words with quotation marks")
    end
end)

mod.on_disabled = function(initial_call)
    script_data.deus_seed = nil
end