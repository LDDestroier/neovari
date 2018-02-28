# NeoVariable Server/API
A "cloud variable" solution for ComputerCraft. Designed to make net-based apps like multiplayer games easier to code.


# Documentation:

 Make sure a NeoVariable server is set up within modem range.
  Functions So Far:
  
   ```serverName, serverID = neovari.findServer( number timeout, number ID )```
  
  Finds a server, and returns its name, with which you'll use with the other functions.
  Searches for '**timeout**' seconds.
  If optional argument '**ID**' is defined, it will only accept the server with that ID.
  
   ```success = neovari.setVariable( string serverName, string gameName, string userName, string variableName, any variableValue )```
  
  Each variable on a NeoVariable server is stored in the following structure:
  *allVariables = {
  	  gameName = {
		  userName = {
			  variableName = variableValue,
		  }, ...
	  }, ...
  }*
  This function sets the variable '**variableName**' inside of '**userName**' inside of '**gameName**' as '**variableName**'.
  
   ```success, variable = neovari.getVariable( string serverName, string gameName, string userName, string variableName )```
  
  This takes the same arguments as neovari.setVariable, except for '**variableValue**'.
  Returns the value of '**variableName**' inside of '**userName**' inside of '**gameName**'.
   
  
   ```success = neovari.setEnvironment( string serverName, string gameName, string userName, table everyVariable )```
  
  Sets every variable in '**serverName**' in '**gameName**' in '**userName**' to all the values in '**everyVariable**'.
  The table 'everyVariable' would be in this string-indexed table format:
  *{
  	var1 = "hello ",
	  var2 = "world!",
    ...
  }*
  
   ```success, environment = getEnvironment( string serverName, string gameName, string userName )```

Returns every variable in '**serverName**' in '**gameName**' in '**userName**' in a string-indexed table, like the one above.
