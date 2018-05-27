--[[
    LavamanSprite.lua - 2014
    
    Copyright Dejaime Antônio de Oliveira Neto, 2014
    
    Released under the MIT license.
    Visit for more information:
    http://opensource.org/licenses/MIT
]]
print("LavamanSprite.lua loaded")

require "love.graphics"


local image_w = 739 --This info can be accessed with a Löve2D call
local image_h = 438 --      after the image has been loaded. I'm creating these for readability.


return {
    serialization_version = 1.0, -- The version of this serialization process

    sprite_sheet = "assets/lavaman_sheet.png", -- The path to the spritesheet
    sprite_name = "lavaman", -- The name of the sprite

    frame_duration = 0.10,
    
    
    --This will work as an array.
    --So, these names can be accessed with numeric indexes starting at 1.
    --If you use < #sprite.animations_names > it will return the total number
    --      of animations in in here.
    animations_names = {
        "idle",
        "attack",
        "get_hit",
        "idle_back",
        "attack_back",
        "get_hit_back"
    },

    --The list with all the frames mapped to their respective animations
    --  each one can be accessed like this:
    --  mySprite.animations["idle"][1], or even
    animations = {
        idle = {
        --  love.graphics.newQuad( X, Y, Width, Height, Image_W, Image_H)
            love.graphics.newQuad( 1, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 83, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 165, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 247, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 329, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 411, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 493, 1, 81, 64, image_w, image_h ),
            love.graphics.newQuad( 575, 1, 81, 64, image_w, image_h )
        },
        
        idle_back = {
            love.graphics.newQuad( 1, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 85, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 169, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 253, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 337, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 421, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 505, 73, 83, 58, image_w, image_h ),
            love.graphics.newQuad( 589, 73, 83, 58, image_w, image_h )
        },
        
        attack = {
            love.graphics.newQuad( 1, 137, 122, 71, image_w, image_h ),
            love.graphics.newQuad( 124, 137, 122, 71, image_w, image_h ),
            love.graphics.newQuad( 247, 137, 122, 71, image_w, image_h ),
            love.graphics.newQuad( 370, 137, 122, 71, image_w, image_h ),
            love.graphics.newQuad( 493, 137, 122, 71, image_w, image_h ),
            love.graphics.newQuad( 616, 137, 122, 71, image_w, image_h )
        },
        
        attack_back = {
            love.graphics.newQuad( 1, 217, 103, 83, image_w, image_h ),
            love.graphics.newQuad( 105, 217, 103, 83, image_w, image_h ),
            love.graphics.newQuad( 209, 217, 103, 83, image_w, image_h ),
            love.graphics.newQuad( 313, 217, 103, 83, image_w, image_h ),
            love.graphics.newQuad( 417, 217, 103, 83, image_w, image_h ),
            love.graphics.newQuad( 521, 217, 103, 83, image_w, image_h )
        },
        
        get_hit = {
            love.graphics.newQuad( 1, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 71, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 141, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 211, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 281, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 351, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 421, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 491, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 561, 309, 69, 58, image_w, image_h ),
            love.graphics.newQuad( 631, 309, 69, 58, image_w, image_h )
        },
        
        get_hit_back = {
            love.graphics.newQuad( 1, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 66, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 131, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 196, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 261, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 326, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 391, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 456, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 521, 373, 64, 64, image_w, image_h ),
            love.graphics.newQuad( 586, 373, 64, 64, image_w, image_h )
        }
        
    } --animations

} --return (end of file)