-- functions to handle the rpg commands
function roll_f(player,argc)
	Game.Broadcast("^2*^7" .. player:Name() .. " ^7 rolled a ^1" .. math.random(6), 16)
	return 1
end

function do_f(player,argc)
	if argc == 1 then
		player:PrintConsole("^7Syntax: /do <text>")
	else
		local msg = Game.ConcatArgs(1)
		Game.Broadcast("^7**^5" .. msg .. " ^7(" .. player:Name() .. "^7)", 16)
	end
	return 1
end

function bolt_f(player,argc)
	if argc == 1 then
		player:PrintConsole("^7Syntax: /bolt <model> <size>")
	else
		local model = Game.Argument(1)
		local size = tonumber(Game.Argument(2))
		player:BoltModel(model,size)
	end
	return 1
end

function toyr2_f(pl,argc)
	pl:BoltModel("models/players/r2d2/model.glm",tonumber(Game.Argument(1)))
	return 1
end

function me_f(player,argc)
	if argc == 1 then
		player:PrintConsole("^7Syntax: /me <action>")
	else
		local msg = Game.ConcatArgs(1)
		Game.Broadcast("^2*^7" .. player:Name() .. " ^7" .. msg, 16)
	end
	return 1
end

function timer_f(player,argc)
	if argc == 1 then
		player:PrintConsole("^7Syntax: /timer <seconds>")
	else
		player:SiegeSpecTimer(tonumber(Game.Argument(1)));
	end
	return 1
end

-- register rpg commands
Game.BindCommand("timer",timer_f)
Game.BindCommand("do", do_f)
Game.BindCommand("me", me_f)
Game.BindCommand("roll", roll_f)
Game.BindCommand("bolt", bolt_f)
Game.BindCommand("toyr2", toyr2_f)