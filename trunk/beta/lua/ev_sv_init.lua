/*-------------------------------------------------------------------------------------------------------------------------
	Serverside initialization
-------------------------------------------------------------------------------------------------------------------------*/

// Show startup message
print( "\n=====================================================" )
print( " Evolve 1.0 by Overv succesfully started serverside." )
print( "=====================================================\n" )

// Load plugins
evolve:loadPlugins( )

// Console command to reload all plugins
concommand.Add( "ev_reloadplugins", function( ply, com, args )
	if ( ply == NULL ) then
		evolve:loadPlugins( )
		evolve:message( "Evolve plugins reloaded!" )
	end
end )

// Add Evolve to the tag list (Probably beta only)
RunConsoleCommand( "sv_tags", GetConVar( "sv_tags" ):GetString( ) .. ",Evolve" )