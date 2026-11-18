extends Node

const ItemDatabase = preload("res://scripts/item_database.gd")
const CombosList = preload("res://scripts/combos_list.gd")

var discovered_items: Array[String] = []

var discovery_count: int = 0

func _ready():
	print("Welcome to Space Alchemy")
	discover_item("hydrogen")
	discover_item("helium")
	discover_item("cosmic_dust")
	discover_item("gravity")
	discover_item("energy")
	discover_item("gas_cloud")
	print("Available items: ", discovered_items.size())
	
func combine_items(item_a: String, item_b: String) -> String:
	var combo_key = item_a + "+" + item_b
	var reverse_key = item_a + "+" + item_b
	
	if CombosList.COMBOS.has(combo_key):
		return CombosList.COMBOS[combo_key]
	if CombosList.COMBOS.has(reverse_key):
		return CombosList.COMBOS[reverse_key]
	
	return ""

func discover_item(item_id: String):
	if not ItemDatabase.ITEMS.has(item_id):
		print("Unknown item: ", item_id)
		return
		
	if discovered_items.has(item_id):
		print("Already discovered: ", item_id)
		return		
		
	discovered_items.append(item_id)
	discovery_count = discovered_items.size()
	
	print("NEW DISCOVERY: ", ItemDatabase.ITEMS[item_id]["name"])			
	print("Total discoveries: ", discovery_count)
		
func save_progess():
	var save_data = {"discovered_items":discovered_items}
	var file = FileAccess.open("user://savegame.json",FileAccess.WRITE)
	if file :
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game progress saved!")
		
		
		
		
		
		
		
		
		
		
