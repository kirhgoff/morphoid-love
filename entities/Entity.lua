-- Represents a single drawable object
local Class = require 'libs.hump.class'

local Entity = Class{}

function Entity:init(world, x, y, w, h)
  self.name = '-'
  self.world = world
  self.x = x
  self.y = y
  self.w = w
  self.h = h
end

function Entity:getRect()
  return self.x, self.y, self.w, self.h
end

function Entity:draw()
  -- Do nothing by default, but we still have to have something to call
end

function Entity:update(dt)
  -- print("Entity.update(dt)"..self.name)
end

function Entity:keypressed(key)
  -- Do nothing by default, but we still have to have something to call
end

function Entity:keyreleased(key)
  -- Do nothing by default, but we still have to have something to call
end

return Entity
