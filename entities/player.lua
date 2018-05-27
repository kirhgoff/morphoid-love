local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'

local player = Class{
  __includes = Entity -- Player class inherits our Entity class
}

function player:init(world, x, y)
  self.img = love.graphics.newImage('/assets/character_block.png')

  Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())

  -- Add our unique player values
  self.xVelocity = 0 -- current velocity on x, y axes
  self.yVelocity = 0
  self.acc = 100 -- the acceleration of our player
  self.maxSpeed = 600 -- the top speed
  self.friction = 20 -- slow our player down - we could toggle this situationally to create icy or slick platforms

  self.world:add(self, self:getRect())
end

function player:update(dt)
  local prevX, prevY = self.x, self.y

  -- Apply Friction
  self.xVelocity = self.xVelocity * (1 - math.min(dt * self.friction, 1))
  self.yVelocity = self.yVelocity * (1 - math.min(dt * self.friction, 1))

	if love.keyboard.isDown("left", "a") and self.xVelocity > -self.maxSpeed then
		self.xVelocity = self.xVelocity - self.acc * dt
	elseif love.keyboard.isDown("right", "d") and self.xVelocity < self.maxSpeed then
		self.xVelocity = self.xVelocity + self.acc * dt
  elseif love.keyboard.isDown("up", "w") and self.yVelocity > - self.maxSpeed then
    self.yVelocity = self.yVelocity - self.acc * dt
  elseif love.keyboard.isDown("down", "s") and self.yVelocity < self.maxSpeed then
    self.yVelocity = self.yVelocity + self.acc * dt
	end

  -- these store the location the player will arrive at should
  local goalX = self.x + self.xVelocity
  local goalY = self.y + self.yVelocity

  -- Move the player while testing for collisions
  self.x, self.y, collisions, len = self.world:move(self, goalX, goalY, self.collisionFilter)
end

function player:draw()
  love.graphics.draw(self.img, self.x, self.y)
  love.graphics.rectangle('line', self:getRect())
end

return player
