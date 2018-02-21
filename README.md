# TileMap Plus
This is a plugin for Godot Engine 3.

Installation:
-------------
Create a folder "assets" inside the root of your project.
Put this repo inside the "assets" folder.
Activate the plugin in the project settings in the GodotEditor.

What is TileMapPlus?
--------------------
This plugin will add a new Node type to Godot. 
Look for 'TileMapPlus' when adding a node, nested 
on the default TileMap.

So, what does it do?
--------------------
TileMapPlus node give you the ability to create auto-tiling rules.
So whenever you paint a tile it will look up the structure of
your tiles and apply those rules.

What is a Rule?
---------------
Its just a way to tell the TileMapPlus "if you see this, do this".
Strictly speaking, its a quintuple:
- *Adjacent State*: a byte that tell which adjacent tile are painted, or not (a bit per neighbour)
- *Tile Id*: which tile from the TileSet the TileMapPlus shoud paint inplace
when the current Adjacent State match a rule's Adjacent State
- *Flip Horizontally*: if it should flip the tile when paiting
- *Flip Vertically*: if it should flip the tile when paiting
- *Transpose*: if it should transpose the tile when paiting

How to use:
-----------
Take a look ate the TileMapPlus node in Godot. You will see it shows 
some new stuff in the Inspector. These are flags to control is behaviour.
- *Add Rule on Draw*: this is how you create a rule. If this flag is ON
and you paint a tile, the TileMapPlus will extract the Rule you used 
and save it.
- *Apply Rules on Draw*: if this is on, whenever you paint a tile the TileMapPlus
will scan all the painted tiles and try to match the tile to a rule, and if
it does, it will apply the rule.
- *Allow Erase Rules*: when you erase a tile, this also can generate a rule.
And things can get messy :) This flag is here mostly to avoid 
trouble, but also because it can be useful to someone.
