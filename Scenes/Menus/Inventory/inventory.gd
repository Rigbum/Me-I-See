class_name Inventory extends Control


@onready var inv: InventoryData = preload("res://Scenes/Menus/Inventory/Ivy_Inventory.tres")
@onready var slots: Array = $MarginContainer/VBoxContainer.get_children()


func _ready():
	inv.update.connect(update_slots)
	update_slots()


var _is_paused:bool = false:
	set = set_paused


func update_slots():
	for Interact in range(min(inv.slots.size(), slots.size())):
		slots[Interact].update(inv.slots[Interact])


func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed("pause"):
		$".".visible = false




func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused


func initialize_focus():
	$MarginContainer/VBoxContainer/ItemSlot.grab_focus()




func _on_item_slot_pressed():
	grab_focus()
