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

func test_is_excluded_is_false_by_default():
	var cell = autofree(Cell.instance())
	assert_false(cell.get_is_excluded())
	
func test_is_excluded_toggles():
	var cell = autofree(Cell.instance())
	cell.toggle_is_excluded()
	assert_true(cell.get_is_excluded())
