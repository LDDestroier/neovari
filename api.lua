-- neovari API

local port = 262

local waitForModem = function(time)
	local tID, evt, rID = os.startTimer(time or 1)
	while true do
		evt, rID = os.pullEvent()
		if evt == "timer" then
			if rID == tID then
				return false
			end
		elseif evt == "peripheral" then
			if peripheral.getType(rID) == "modem" then
				return true
			end
		end
	end
end

local getModem = function()
	local modems = {peripheral.find("modem")}
	if #modems == 0 then
		if waitForModem(3) then
			modems = {peripheral.find("modem")}
		else
			error("No modem found...")
		end
	end
	for a = 1, #modems do
		if peripheral.wrap(modems[a]).isWireless() then
			return peripheral.wrap(modems[a])
		end
	end
	return peripheral.wrap(modems[1])
end

local modem = getModem()

getVariable = function()