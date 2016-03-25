# TODO:

~~Drop explorer on screen (4x size?)~~
- ~~have her move with AOEU~~
- ~~have her face the cursor~~
- **Free rotation** ~~vs sprited rotation
    note, can't do free rotation in with 2.5d sprites
    shouldn't do sprited rotation with 3D models.~~
    
Draw sword telegraph in front of explorer
- move it in and out slightly based on mouse distance
- click and animate
    
Add some things to hit
- set up tile reporting; draw some temp tiles
- set up pixel collision within tiles
    
~~Set camera~~
- pseudo centered on explorer, slight offset for cursor
- set camera as a class; have multiples.
    
Basic level formating
- floor, walls
- enemies, spawners with rules
- objects, doors
    
A few enemies
- (slimes first? :wink:)
- small and fast
- immobile turret
- knight sized, a bit slow
- big and slow, AOE
    
Acceleration, instead of raw movement.

Gun and redo projectile objects if needed
    
Reconsider art direction
- 2.5D? Voxel 3D? Proper 3D?
- I think I'll stick to 2.5D, with an entirely 2D data set. This should help avoid some of the problems Spiral knights had with collisions on it's Z axis!
- Recode with flat data layer, and with pretty 2.5d/layer
- Tiles? Isometric?

Puzzle and trap tiles
- buttons, switches, gates
- spikes

level generation
- handcrafted rooms, hallways
- determine how many and piece together

Clean up engine

Create items with art
- rock paper scissors (neutral) advantage system
- variety of speed:strength
- shields strength:coverage area
    
Create level tilesets and rooms.

Treasure

Crafting

Multiplayer
- Lobby server is part of the world
- Players collect whatever, allowing them to host private arcade rooms
- Some for free each day (Remember mist energy?!)
- When a private room is created, it gets an id or something from the main server and has a total treasure limit, min time, etc that is recorded
- End notification is sent back to the main server, which records important items and such so that people can't cheat as easily.
- It's tough to actually make sure, so it's best to just remove the motivation for cheating wherever possible
- Main server should monitor, but not *run* the rooms; this saves on resources, and potentially allows for smoother local gameplay.
- Cheating is *inevitable*

Story
- In a virtual reality
- out to collecting something in each level
- world occasionally breaks apart or corrupts
- world and subworlds    
