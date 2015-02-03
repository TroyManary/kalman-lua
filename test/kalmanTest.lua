kalman = require"kalman"
local init = 0.390
local noise = 0.1

kalFilter = kalman.new(noise,init)
kalFilter:print()
kalFilter:printState()

print(kalFilter:update(0.500))
print(kalFilter:update(0.480))
print(kalFilter:update(0.290))
print(kalFilter:update(0.250))
print(kalFilter:update(0.320))
print(kalFilter:update(0.340))
print(kalFilter:update(0.480))
print(kalFilter:update(0.410))
print(kalFilter:update(0.450))