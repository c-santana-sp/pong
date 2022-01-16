Background = {}

function Background:load()
  self.planets = love.graphics.newImage("assests/planets.png")
  self.universe = love.graphics.newImage("assests/universe.png")
  self.width = self.planets:getWidth()
  self.heigth = self.planets:getHeight()
  self.rotation = 0
end

function Background:update(dt)
  self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
  love.graphics.draw(self.universe, 0, 0)
  love.graphics.draw(self.planets, self.width / 2, self.heigth / 2, self.rotation, 1, 1, self.width / 2, self.heigth / 2)
end
