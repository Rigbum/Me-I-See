class_name InventoryUI extends Control


const Inventory_Slot =preload("res://Scenes/Menus/Inventory/inventory.tscn")

@export var data : InventoryData

@onready var Inventory: = $"../.."


	
	

func clear_Inventory() -> void:
	for c in get_children():
		c.queue_free()
		
		
		
func update_inventory() -> void:
	for s in data.slots:
		var new_slot = Inventory_Slot.instantiate()
		add_child(new_slot)
