/*-------------------------------------------------------------------------------------------------------------------------
	Provides chat commands
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = { }
PLUGIN.Title = "Chat Commands"
PLUGIN.Description = "Provides chat commands to run plugins."
PLUGIN.Author = "Overv"
PLUGIN.ChatCommand = nil
PLUGIN.Usage = nil

function PLUGIN:GetCommand( msg )
	return string.match( msg, "%w+" )
end

function PLUGIN:GetArguments( msg )
	local args = { }
	local i = 1
	
	for v in string.gmatch( msg, "%S+" ) do
		if i > 1 then table.insert( args, v ) end
		i = i + 1
	end
	
	return args
end

function PLUGIN:PlayerSay( ply, msg )
	if ( string.Left( msg, 1 ) == "!" ) then
		local command = self:GetCommand( msg )
		local args = self:GetArguments( msg )
		
		for _, plugin in pairs( evolve.plugins ) do
			if ( plugin.ChatCommand == string.lower( command or "" ) ) then
				res, ret = pcall( plugin.Call, plugin, ply, args )
				
				if ( !res ) then
					evolve:Notify( evolve.colors.red, "Plugin '" .. plugin.Title .. "' failed with error:" )
					evolve:Notify( evolve.colors.red, ret )
				end
				
				//plugin:Call( ply, args )
				return ""
			end
		end
		
		evolve:Notify( ply, evolve.colors.red, "Unknown command '" .. ( command or "" ) .. "'." )
	end
end

evolve:RegisterPlugin( PLUGIN )