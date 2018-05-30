local Class = require 'libs.hump.class'
local Entity = require 'entities.Entity'
local peachy = require 'libs.peachy.peachy'

local Monster = Class{
  __includes = Entity 
}

function Monster:init(world, x, y, assetName, tag)
  jsonName = "assets/"..assetName..".json"
  imageName = "assets/"..assetName..".png"
  
  print("Loading ["..jsonName.."], ["..imageName.."]")
  self.sprite = peachy.new(jsonName, love.graphics.newImage(imageName), tag)

  Entity.init(self, world, x, y, 16, 16) -- TODO find width and height

  self.world:add(self, self:getRect())
end

function Monster:draw()
  print("Monster:draw()")
  self.sprite:draw(self.x, self.y)
end

function Entity:update(dt)
  print("Monster:update()")
  self.sprite:update(dt)
end

return Monster
