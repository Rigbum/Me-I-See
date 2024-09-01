extends Button


@onready var item_text: Button = $"."

func update(slot: InvSlot):
	if !slot.item:
		item_text.text = "---"
	elif slot.item:
		item_text.text = slot.item.name
