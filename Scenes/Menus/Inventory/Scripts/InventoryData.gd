class_name InventoryData extends Resource





signal update


@export var slots: Array[ InvSlot ]

func insert(item: ItemData):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0] += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item
		if slots != null:
			print(item.name)

func insertp(item: ItemData):
	pass
	var emptyslots = slots.filter(func(slot): return slot.item == null)
	if !emptyslots.is_empty():
		emptyslots[0].item
		if slots != null:
			print(item.name)
	update.emit()
