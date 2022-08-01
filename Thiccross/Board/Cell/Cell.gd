extends TextureButton

var _is_dirty := false
var _is_on := false
var _is_excluded := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_is_dirty() -> bool:
	return _is_dirty
	
func set_is_dirty() -> void:
	_is_dirty = true

func get_is_on() -> bool:
	return _is_on

func toggle_is_on() -> void:
	_is_on = !_is_on

func get_is_excluded() -> bool:
	return _is_excluded

func toggle_is_excluded() -> void:
	_is_excluded = !_is_excluded

