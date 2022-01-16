socket = require("socket")

Player = {}

function Player:load()
  self.x = 50
  self.y = love.graphics.getHeight() / 2
  self.img = love.graphics.newImage("assests/1.png")
  self.width = self.img:getWidth()
  self.height = self.img:getHeight()
  self.speed = 800

  self.yVel = 0
  self.speed = 800
end

function Player:update(dt)
  self:move(dt)
  -- self:acquireTarget()
  self:checkoutBoundaries()
end

function Player:move(dt)
  if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    self.y = self.y + self.speed * dt
  end
end

-- function Player:move(dt)
--   self.y = self.y + self.yVel * dt
--   self:acquireTarget()
-- end

function Player:acquireTarget()
  if Ball.y + Ball.height < self.y then
    self.yVel = -self.speed
  elseif Ball.y > self.y + self.height then
    self.yVel = self.speed
  else
    self.yVel = 0
  end
end

function Player:checkoutBoundaries()
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > love.graphics.getHeight() then
    self.y = love.graphics.getHeight() - self.height
  end
end

function Player:draw()
  love.graphics.draw(self.img, self.x, self.y)
end
