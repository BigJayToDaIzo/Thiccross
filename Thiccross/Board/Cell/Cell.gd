extends TextureButton

var _is_dirty := false
var _is_on := false
var _is_excluded := false

onready var white_square_texture := ImageTexture.new()
onready var black_square_texture := ImageTexture.new()
onready var excluded_square_texture := ImageTexture.new()
onready var white_square_image := Image.new()
onready var black_square_image := Image.new()
onready var excluded_square_image := Image.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	white_square_image.load("res://Thiccross/Board/Cell/assets/white_square.png")
	white_square_texture.create_from_image(white_square_image)
	black_square_image.load("res://Thiccross/Board/Cell/assets/black_square.png")
	black_square_texture.create_from_image(black_square_image)
	excluded_square_image.load("res://Thiccross/Board/Cell/assets/excluded.png")
	excluded_square_texture.create_from_image(excluded_square_image)
	
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
