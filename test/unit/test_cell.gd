extends GutTest

var cell_path = 'res://Thiccross/Puzzleboard/Cell/Cell.tscn'
var Cell = load(cell_path)
var _cell = null
var Event := InputEventMouseButton.new()
var _event = null

# Called when the node enters the scene tree for the first time.
func before_each():
	_cell = Cell.instance()
	_event = Event
	add_child(_cell)
	
func after_each():
	_cell.free()
	
func test_can_create_cell():
	assert_not_null(_cell)
	
func test_is_dirty_is_false_by_default():
	assert_false(_cell.get_is_dirty())
	
func test_set_is_dirty():
	_cell.set_is_dirty()
	assert_true(_cell.get_is_dirty())

func test_is_on_is_false_by_default():
	assert_false(_cell.get_is_on())
	
func test_is_on_toggles():
	_cell.toggle_is_on()
	assert_true(_cell.get_is_on())

func test_is_on_toggles_sets_dirty():
	_cell.toggle_is_on()
	assert_true(_cell.get_is_dirty())

func test_is_excluded_is_false_by_default():
	assert_false(_cell.get_is_excluded())
	
func test_is_excluded_toggles():
	_cell.toggle_is_excluded()
	assert_true(_cell.get_is_excluded())
	
func test_is_excluded_toggles_sets_dirty():
	_cell.toggle_is_excluded()
	assert_true(_cell.get_is_dirty())
	
func test_texture_normal_default_set():
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/white_square.png-")
	
func test_texture_changes_to_black_square_if_white_and_left_clicked():
	_event.set_button_index(1)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/black_square.png-")

func test_texture_changes_to_excluded_if_white_and_right_clicked():
	_event.set_button_index(2)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/excluded.png-")
	
# All happy and sad paths on _on_Cell_gui_input()
func test_on_Cell_gui_input_does_nothing_when_event_not_InputEventMouseButton():
	var _wrong_event := InputEventMouse.new()
	_cell._on_Cell_gui_input(_wrong_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/white_square.png-")
	
func test_on_Cell_gui_input_does_nothing_when_event_pressed_false():
	_event.set_pressed(false)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/white_square.png-")

func test_on_Cell_gui_input_calls_toggle_is_on_when_l_mouse_pressed_and_not_is_excluded():
	_event.set_button_index(1)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/black_square.png-")
	
func test_on_Cell_gui_input_does_not_call_toggle_is_on_when_l_mouse_pressed_and_is_excluded():
	_event.set_button_index(2)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	_event.set_button_index(1)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/excluded.png-")
	
func test_on_Cell_gui_input_calls_toggle_excluded_when_r_mouse_pressed_and_not_is_on():
	_event.set_button_index(2)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/excluded.png-")
	
func test_on_Cell_gui_input_does_not_call_toggle_excluded_whe_r_mouse_pressed_and_is_on():
	_event.set_button_index(1)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	_event.set_button_index(2)
	_event.set_pressed(true)
	_cell._on_Cell_gui_input(_event)
	assert_string_contains(_cell.texture_normal.load_path, "res://.import/black_square.png-")
