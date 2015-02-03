kalman = require"kalman"
local noise = 10
local data = {}

dataFile = io.open("accelData.txt", "r")

repeat
  str = dataFile:read()
  if str then
    local i=0
    for val in string.gmatch(str, '([^ ]+)') do
	  data[i] = tonumber(val)
	  i=i+1
	end
	if not kalFilter then
      kalFilter = kalman.new(noise, data[1])
	  init=false
	else
	  print(kalFilter:update(data[1]))
	end
 end
until not str
