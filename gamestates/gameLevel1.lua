-- TODO make it generic

-- Import our libraries.
local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'

-- Grab our base class
local LevelBase = require 'gamestates.LevelBase'

-- Import the Entities we will build.
local Player = require 'entities.Player'
local Monster = require 'entities.Monster'

local camera = require 'libs.camera'

local inspect = require 'libs.inspect.inspect'

-- Declare a couple important variables
player = nil

local gameLevel1 = Class{
  __includes = LevelBase
}

function gameLevel1:init()
  LevelBase.init(self, 'assets/levels/sandbox_2.lua')
end

function gameLevel1:enter()
  player = Player(self.world,  400, 400)
  LevelBase.Entities:add(player)
  LevelBase.Entities:addMany({
    Monster(self.world, 100, 100, "bat", "Idle"),
    Monster(self.world, 500, 200, "bat", "Idle"),
    Monster(self.world, 400, 500, "bat", "Idle")
  })
end

function gameLevel1:update(dt)
  self.map:update(dt) -- remember, we inherited map from LevelBase
  LevelBase.Entities:update(dt) -- this executes the update function for each individual Entity

  LevelBase.positionCamera(self, player, camera)
end

function gameLevel1:draw()
  -- Attach the camera before drawing the entities
  camera:set()
  self.map:draw(-camera.x, -camera.y) -- Remember that we inherited map from LevelBase
  LevelBase.Entities:draw() -- this executes the draw function for each individual Entity
  camera:unset()
  -- Be sure to detach after running to avoid weirdness
end

-- All levels will have a pause menu
function gameLevel1:keypressed(key)
  LevelBase:keypressed(key)
end

return gameLevel1
