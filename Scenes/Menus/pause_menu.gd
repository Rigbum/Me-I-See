extends Control

var _is_paused:bool = false:
	set = set_paused
	
	
	
func _unhandled_input(event: InputEvent) ->void:
	if event.is_action_pressed("pause"):
		$MarginContainer/VBoxContainer/Status.grab_focus()
		$Inventory.visible = false
		_is_paused = !_is_paused
	if event.is_action_pressed("pause") and $Inventory.visible == false:
		$MarginContainer/VBoxContainer.visible = true



func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused
	
	
func _on_status_pressed():
	grab_focus()
	

func _on_inventory_pressed():
	$MarginContainer/VBoxContainer.visible = false
	$Inventory.visible = true
	$Inventory.initialize_focus()



func _on_resume_pressed():
	_is_paused = false


func _on_quit_pressed():
	get_tree().quit()
