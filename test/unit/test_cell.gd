extends GutTest

var Cell = load('res://Thiccross/Board/Cell/Cell.tscn')
# Called when the node enters the scene tree for the first time.

func test_can_create_cell():
	var cell = autofree(Cell.instance())
	assert_not_null(cell)
	
func test_is_dirty_is_false_by_default():
	var cell = autofree(Cell.instance())
	assert_false(cell.get_is_dirty())
	
func test_set_is_dirty():
	var cell = autofree(Cell.instance())
	cell.set_is_dirty()
	assert_true(cell.get_is_dirty())

func test_is_on_is_false_by_default():
	var cell = autofree(Cell.instance())
	assert_false(cell.get_is_on())
	
func test_is_on_toggles():
	var cell = autofree(Cell.instance())
	cell.toggle_is_on()
	assert_true(cell.get_is_on())

func test_is_on_toggles_sets_dirty():
	var cell = add_child_autofree(Cell.instance())
	cell.toggle_is_on()
	assert_true(cell.get_is_dirty())

func test_is_excluded_is_false_by_default():
	var cell = autofree(Cell.instance())
	assert_false(cell.get_is_excluded())
	
func test_is_excluded_toggles():
	var cell = autofree(Cell.instance())
	cell.toggle_is_excluded()
	assert_true(cell.get_is_excluded())
	
func test_is_excluded_toggles_sets_dirty():
	var cell = add_child_autofree(Cell.instance())
	cell.toggle_is_excluded()
	assert_true(cell.get_is_dirty())
	
	# TODO: try to figure out how to ensure it's loading correct resource
func test_texture_normal_default_set():
	var cell = add_child_autofree(Cell.instance())
	assert_not_null(cell.texture_normal)
	
	# TODO: must figure out above todo to test these things
func test_texture_changes_to_black_square_if_white_and_left_clicked():
	pass

func test_texture_doesnt_change_to_black_if_excluded_and_left_clicked():
	pass

func test_texture_changes_to_excluded_if_white_and_right_clicked():
	pass

func test_texture_doesnt_change_to_excluded_if_black_and_right_clicked():
	pass
	
