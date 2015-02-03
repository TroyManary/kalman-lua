local kalman = {}
kalman.__index = kalman

function kalman.new(noise, value)
  value = value or 0
  local self = setmetatable({}, kalman)
  self.x = value
  self.R = noise
  self.P = 1
  self.K = self.P/(self.P+self.R)
  return self
end

function kalman.reset(self, value)
  value = value or 0
  self.x = value
  self.K = self.P/(self.P+self.R)
end

function kalman.update(self, value)
  self.K = self.P/(self.P+self.R)
  self.x = self.x+self.K*(value-self.x)
  self.P = (1-self.K)
  return self.x
end

function kalman.getValue(self)
  return self.x
end

function kalman.print(self)
  print(self.x)
end

function kalman.printState(self)
  print(self.x, self.P, self.K, self.R)
end

return kalman