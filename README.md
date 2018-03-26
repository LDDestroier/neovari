# NeoVariable Server/API
A "cloud variable" solution for ComputerCraft using the modem API. Designed to make net-based apps like multiplayer games easier to code.

## Downloads:
Client API:
```
wget https://raw.githubusercontent.com/LDDestroier/neovari/master/neovari neovari
```
Server Program:
```
wget https://raw.githubusercontent.com/LDDestroier/neovari/master/neoserver neoserver
```

The server does not require the client API.

# Documentation:

Make sure a NeoVariable server is set up within modem range.
When there's a timeout, the default is to wait for a response for 1 second.
 Functions So Far:

```
serverName, serverID = neovari.findServer( number timeout, number ID )
```
Finds a server, and returns its name, with which you'll use with the other functions.
Searches for '**timeout**' seconds.
If optional argument '**ID**' is defined, it will only accept the server with that ID.

```
neovari.findServerList( number timeout )
```
Returns a list of servers with their names and IDs.
Formatted as such:
```
{
	[1] = {
		serverName = "Server1",
		id = 1
	},
	[2] = {
		serverName = "Server2",
		id = 2
	}, ...
}
```

```
success/modemName = neovari.specifyModem( string_or_peripheral modemPeripheral )
```
This locks NeoVariable to use one modem, instead of using whatever modem is handy, prioritizing wireless ones.
If no arguments are given, NeoVariable will revert back to using whatever wireless modem is handy.

  
```
success = neovari.setVariable( string serverName, string gameName, string userName, string variableName, any variableValue )
```
This function sets the variable '**variableName**' inside of '**userName**' inside of '**gameName**' as '**variableName**'.
Each variable on a NeoVariable server is stored in the following structure:
```
allVariables = {
  	gameName = {
		userName = {
			variableName = variableValue,
		}, ...
	}, ...
}`
```

```
success, variable = neovari.getVariable( string serverName, string gameName, string userName, string variableName )```
```
This takes the same arguments as neovari.setVariable, except for '**variableValue**'.
Returns the value of '**variableName**' inside of '**userName**' inside of '**gameName**'.
 
```
success = neovari.setEnvironment( string serverName, string gameName, string userName, table everyVariable )```
```
Sets every variable in '**serverName**' in '**gameName**' in '**userName**' to all the values in '**everyVariable**'.
The table 'everyVariable' would be in this string-indexed table format:
```
{
	var1 = "hello ",
	var2 = "world!",
	...
}`
```

```
success, environment = getEnvironment( string serverName, string gameName, string userName )```
```
Returns every variable in '**serverName**' in '**gameName**' in '**userName**' in a string-indexed table, like the one above.

```
success, users = neovari.getUsers( string serverName, string gameName )
```
Returns a numerically indexed table containing all users that have variables attached to them.

```
success = neovari.clearVariable( string serverName, string gameName, string variableName )
```
Sets '**variableName**' in '**gameName**' in '**serverName**' to nil.

```
success = neovari.clearUser(string serverName, string.gameName, string userName)
```
Sets every variable belonging to '**userName**' to nil, effectively removing that user from '**gameName**'.

```
success = neovari.clearGame( string serverName, string gameName )
```
Removes '**gameName**' from '**serverName**', along with any users within it.

```
neovari.queueEvent( string serverName, string gameName, table tableOfEvents )
```
Sends an event + argument list to '**serverName**' for use with '**gameName**'. Format the events like this:
```
{
	eventName,
	parameter1,
	parameter2,
	...
}
```

```
neovari.pullEvent( string serverName, string gameName, string eventName )
```
Receives an event sent by 'neovari.queueEvent' to '**serverName**' and '**gameName**', similar to how os.pullEvent() handles it.
Argument '**eventName**' is optional.
