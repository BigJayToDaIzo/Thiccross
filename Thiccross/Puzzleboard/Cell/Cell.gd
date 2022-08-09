extends TextureButton

var _is_dirty := false
var _is_on := false
var _is_excluded := false
var white_square_texture_path := "res://Thiccross/Puzzleboard/Cell/assets/white_square.png"
var black_square_texture_path := "res://Thiccross/Puzzleboard/Cell/assets/black_square.png"
var excluded_square_texture_path := "res://Thiccross/Puzzleboard/Cell/assets/excluded.png"

onready var white_square_texture: StreamTexture = load(white_square_texture_path)
onready var black_square_texture: StreamTexture = load(black_square_texture_path)
onready var excluded_square_texture: StreamTexture = load(excluded_square_texture_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_normal = white_square_texture
	
func get_is_dirty() -> bool:
	return _is_dirty
	
func set_is_dirty() -> void:
	_is_dirty = true

func get_is_on() -> bool:
	return _is_on

func toggle_is_on() -> void:
	check_is_dirty_and_set()
	_is_on = !_is_on
	if(_is_on):
		texture_normal = black_square_texture
	else:
		texture_normal = white_square_texture 

func get_is_excluded() -> bool:
	return _is_excluded

func toggle_is_excluded() -> void:
	check_is_dirty_and_set()
	_is_excluded = !_is_excluded
	if(_is_excluded):
		texture_normal = excluded_square_texture
	else:
		texture_normal = white_square_texture

func check_is_dirty_and_set():
	if(!_is_dirty):
		set_is_dirty()

func _on_Cell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				if not(get_is_excluded()):
					toggle_is_on()
			BUTTON_RIGHT:
				if not(get_is_on()):
					toggle_is_excluded()
