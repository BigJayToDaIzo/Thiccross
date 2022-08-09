extends GutTest

var Puzzleboard = load("res://Thiccross/Puzzleboard/Puzzleboard.tscn")
var _puzzleboard = null
var Cell = load('res://Thiccross/Puzzleboard/Cell/Cell.tscn')
var _cell = null

func before_each():
	_puzzleboard = Puzzleboard.instance()
	add_child(_puzzleboard)
	
func after_each():
	_puzzleboard.free()

func test_can_create_puzzleboard():
	assert_not_null(_puzzleboard)
	
func test_exports_board_width():
	assert_exports(_puzzleboard, "board_width", TYPE_INT)

func test_exports_board_height():
	assert_exports(_puzzleboard, "board_height", TYPE_INT)
