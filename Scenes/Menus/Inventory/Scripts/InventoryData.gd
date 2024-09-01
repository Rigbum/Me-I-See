class_name InventoryData extends Resource





signal update


@export var slots: Array[ InvSlot ]

func insert(item: ItemData):
	#Check for slots containing the item you have
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0] += 1
	else:
		#Check for empty slots
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			#Assign the item you're piching up, called 'item' to the 'item' variable of the first empty slot
			emptyslots[0].item = item
	#Check every inventory slot, call the one you're checking 'slot'
	for slot in slots:
		#If an item exists, print its name
		if slot.item != null:
			print(slot.item.name)
	update.emit()
