extends Node2D

const N = 1
const E = 2
const S = 4
const W = 8

var cell_walls = {Vector2(0, -1): N, Vector2(1, 0): E, 
				  Vector2(0, 1): S, Vector2(-1, 0): W}

var tile_size = 64  # tile size (in pixels)
var width = 10  # width of map (in tiles)
var height = 5  # height of map (in tiles)

# get a reference to the map for convenience
onready var Map = $TileMap

func _ready():
	randomize()
	tile_size = Map.cell_size
	#print_debug("t", tile_size)
	#print_debug("c", Map.cell_size)
	make_maze()
	Global.reset()
	

	
func check_neighbors(cell, unvisited):
	# returns an array of cell's unvisited neighbors
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
			#print_debug("cell key = ",cell_walls.key)
		#print_debug("cell = ",cell)
		#print_debug("n = ",n)
		#print_debug("cell + n = ",cell + n)
		#print_debug("unvisited = ",unvisited)
		#print_debug("list = ",list)
	return list
	
func PlaceGoal():
	var rng = RandomNumberGenerator.new()
	rng.seed = hash(randi())
	
	var complete_scene = preload("res://Complete.tscn").instance()
	var location = Vector2()
	
	location.x =  width * 64 - 32
	location.y = rng.randi_range(1, height) * 64 - 32
	complete_scene.position = location
	add_child(complete_scene)
	
func PlaceTrap():
	var rng = RandomNumberGenerator.new()
	rng.seed = hash(randi())
	
	var Trap = preload("res://Trap.tscn").instance()
	var location = Vector2()
	
	location.x = rng.randi_range(2, width-1) * 64 - 32
	location.y = rng.randi_range(2, height-1) * 64 - 32
	Trap.position = location
	add_child(Trap)
	
func PlacePlayer():
	var player = preload("res://Player.tscn").instance()
	var location = Vector2()
	
	location.x = 64 - 32
	location.y = height * 64 - 32
	player.position = location
	add_child(player)
	
func PlaceItemFuel():
	var Fuel = preload("res://Item_Fuel.tscn").instance()
	var location = Vector2()
	
	location.x = 64 - 32
	location.y = 64 - 32
	Fuel.position = location
	add_child(Fuel)
	
func make_maze():
	
	PlaceGoal()
	PlaceItemFuel()
	PlacePlayer()
		
	var unvisited = []  # array of unvisited tiles
	var stack = []
	# fill the map with solid tiles
	Map.clear()
	for x in range(width):
		for y in range(height):
			unvisited.append(Vector2(x, y))
			Map.set_cellv(Vector2(x, y), N|E|S|W)
			#print_debug("x = ",x)
			#print_debug("y = ",y)
			#print_debug("unvisited = ",unvisited)
	var current = Vector2(0, 0)
	unvisited.erase(current)
	#print_debug("unvisited now = ",unvisited)
	# execute recursive backtracker algorithm
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		if neighbors.size() > 0:
			#print_debug("s :",stack)
			#print_debug(neighbors.size())
			var next = neighbors[randi() % neighbors.size()]
			#print_debug("next = ",next)
			#print_debug("current = ",current)
			stack.append(current)
			#print_debug(stack)
			# remove walls from *both* cells
			var dir = next - current
			#print_debug("Next - Current = ",next,"-", current,"Dir = ", dir)
			var current_walls = Map.get_cellv(current) - cell_walls[dir]
			#print_debug("map current = ",Map.get_cellv(current))
			#print_debug("cr cell wall = ",cell_walls[dir])
			#print_debug("cr_wall = ",current_walls)
			var next_walls = Map.get_cellv(next) - cell_walls[-dir]
			#print_debug("map next = ",Map.get_cellv(next))
			#print_debug("nx cell wall = ",cell_walls[-dir])
			#print_debug("nx_wall = ",next_walls)
			Map.set_cellv(current, current_walls)
			Map.set_cellv(next, next_walls)
			current = next
			#print_debug("unvisited = ", unvisited)
			unvisited.erase(current)
			#print_debug("dir = ",dir)
			#print_debug("unvisited_1 = ",unvisited)
		elif stack:
			#print_debug("stack :",stack)
			current = stack.pop_back()
			
		
		#yield(get_tree(), 'idle_frame')
		

