extends GutTest

var Cell = load('res://Thiccross/Puzzleboard/Cell/Cell.tscn')
var _cell = null

# Called when the node enters the scene tree for the first time.

func before_each():
	_cell = Cell.instance()
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
	
	# TODO: try to figure out how to ensure it's loading correct resource
func test_texture_normal_default_set():
	assert_not_null(_cell.texture_normal)
	
	# TODO: must figure out above todo to test these things
func test_texture_changes_to_black_square_if_white_and_left_clicked():
	pass

func test_texture_doesnt_change_to_black_if_excluded_and_left_clicked():
	pass

func test_texture_changes_to_excluded_if_white_and_right_clicked():
	pass

func test_texture_doesnt_change_to_excluded_if_black_and_right_clicked():
	pass
	
