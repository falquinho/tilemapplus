tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("TileMapPlus", "TileMap", preload("TileMapPlus.gd"), preload("icon.png"))
	add_custom_type("TilingRuleSet", "Resource", preload("TilingRuleSet.gd"), preload("icon.png"))
	pass

func _exit_tree():
    remove_custom_type("TilingRuleSet")
    remove_custom_type("TileMapPlus")
    pass