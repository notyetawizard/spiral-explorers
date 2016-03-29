# TODO:

Create object classes for stuff
- Fix entity class, which is currently nested in the shape class despite the fact that I have not a fucking clue as to what is going on in there, and I may well be writing over *any number of important things*.
- I think it would be nice to rewrite/strip the HC stuff down to what I need and merge it with entities; I should understand what's going on, and this would let me throw in better move functions and such.
- Triangles, triangles, triangles. I've got this!
- Add in a "save/load shape/object" feature *post* creation; this will save on having to call whatever the new equivalent to HC.Polygon() to do the math for shape creation each time one is needed. This will be *very* helpful for projectiles.
- **NOTE:** The longer you wait to do this, the more work it will be to change! However, if you get stuck on it before you have at least a simple game, you might lose interest. Hmm.

Set camera
- ~~pseudo centered on explorer,~~ slight offset for cursor
- set camera as a class; have multiples.
- add to each entity? Or have a camera:focus(entity)

Projectiles
 - limit distance
 - limit number of objects can hit
 - all attacks fall under projectile class

Basic level formating
- floor, walls
- enemies, spawners with rules
- objects, doors
- add default friction; floor objects that modify (move out of entity.friction!)

A few enemies
- (slimes first? :wink:)
- small and fast
- immobile turret
- knight sized, a bit slow
- big and slow, AOE
    
Change rotation to *not* wrap? If you spin your mouse around your guy three times, she spins three times too!

Draw sword telegraph in front of explorer
- move it in and out slightly based on mouse distance
- click and animate

Puzzle and trap tiles
- buttons, switches, gates
- spikes

level generation
- handcrafted rooms, hallways
- determine how many and piece together
- actually, it might be nice to skip halways altogether; they were occasionally far too long in spiral knights, and you would spend a long time just walkin back and forth down them for the occasional treasure room. The same linking effect could be accomplished with some kind of teleporter, keeping the flow of game play up. Perhaps like the matrix nodes in shadowrun?
- *handcrafted* hallways, of course, and even telelinked rooms that are just hallways could still exist where the setting calls for it!

Create items
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
