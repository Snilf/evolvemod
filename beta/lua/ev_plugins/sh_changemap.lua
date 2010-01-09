/*-------------------------------------------------------------------------------------------------------------------------
	Change the map
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = { }
PLUGIN.Title = "Change Map"
PLUGIN.Description = "Change the map."
PLUGIN.Author = "Overv"
PLUGIN.ChatCommand = "map"
PLUGIN.Usage = nil

function PLUGIN:Call( ply, args )
	if ( ply:EV_IsAdmin() ) then
		if ( args[1] and file.Exists( "../maps/" .. args[1] .. ".bsp" ) ) then
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has changed the map to ", evolve.colors.red, args[1], evolve.colors.white, "." )
			timer.Simple( 0.5, function() RunConsoleCommand( "changelevel", args[1] ) end )
		else
			evolve:Notify( ply, evolve.colors.red, "Specified map not found!" )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:RegisterPlugin( PLUGIN )