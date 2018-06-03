-- Each level will inherit from this class which itself inherits from Gamestate.
-- This class is Gamestate but with function for loading up Tiled maps.

local bump = require 'libs.bump.bump'
local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'
local sti = require 'libs.sti.sti' -- New addition here
local Entities = require 'entities.Entities'
local camera = require 'libs.camera' -- New addition here

local LevelBase = Class{
  __includes = Gamestate,

  init = function(self, mapFile)
    self.map = sti(mapFile, { 'bump' })
    self.world = bump.newWorld(32)
    self.map:resize(love.graphics.getWidth(), love.graphics.getHeight())
    self.map:bump_init(self.world)

    Entities:enter()
  end,
  
  Entities = Entities,
  camera = camera
}

function LevelBase:keypressed(key)
  -- All levels will have a pause menu
  if Gamestate.current() ~= pause and key == 'p' then
    Gamestate.push(pause)
  end
end

function LevelBase:positionCamera(player, camera)
  local mapWidth = self.map.width * self.map.tilewidth -- get width in pixels
  local mapHeight = self.map.height * self.map.tileheight 
  local halfScreenWidth =  love.graphics.getWidth() / 2
  local halfScreenHeight =  love.graphics.getHeight() / 2

  if player.x < (mapWidth - halfScreenWidth) then -- use this value until we're approaching the end.
    boundX = math.max(0, player.x - halfScreenWidth) -- lock camera at the left side of the screen.
  else
    boundX = math.min(player.x - halfScreenWidth, mapWidth - love.graphics.getWidth()) -- lock camera at the right side of the screen
  end

  if player.y < (mapHeight - halfScreenHeight) then -- use this value until we're approaching the end.
    boundY = math.max(0, player.y - halfScreenHeight) -- lock camera at the left side of the screen.
  else
    boundY = math.min(player.y - halfScreenHeight, mapHeight - love.graphics.getHeight()) -- lock camera at the right side of the screen
  end

  -- print(string.format("Camera position: (%f,%f) mwh=(%f,%f) hlf=(%f,%f) p=(%f,%f)", 
  --   boundX, boundY, mapWidth, mapHeight, halfScreenWidth, halfScreenHeight, player.x, player.y))

  camera:setPosition(boundX, boundY)
end

return LevelBase
