extends Control

onready var cell := $Cell
onready var label_is_dirty := $VBoxContainer/is_dirty
onready var label_is_on := $VBoxContainer/is_on
onready var label_is_excluded := $VBoxContainer/is_excluded

func _process(_delta: float) -> void:
	label_is_dirty.text = "_is_dirty: " + str(cell.get_is_dirty())
	label_is_on.text = "(l_click)_is_on: " + str(cell.get_is_on())
	label_is_excluded.text = "(r_click)_is_excluded: " + str(cell.get_is_excluded())
