local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local peachy = require 'libs.peachy.peachy'
local inspect = require 'libs.inspect.inspect'

local Monster = Class{
  __includes = Entity 
}

function Monster:init(world, x, y, assetName, tag)
  -- print("Loading ["..jsonName.."], ["..imageName.."]") -- TODO optimise
  self.sprite = peachy.new("assets/"..assetName..".json", love.graphics.newImage("assets/"..assetName..".png"), tag)
  _, _, w, h = self.sprite.frame.quad:getViewport()
  Entity.init(self, world, x, y, w, h) 
  self.world:add(self, self:getRect())
end

function Monster:draw()
  self.sprite:draw(self.x, self.y)
  love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
end

function Monster:update(dt)
  self.sprite:update(dt)
end

return Monster
