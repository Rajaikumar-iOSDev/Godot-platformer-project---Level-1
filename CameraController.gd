extends Camera2D

# Get Player node from MainScene
onready var player = get_node("/root/MainScene/Player")

func _process(delta):
	# Set Camera's  'x' position to player's 'x' position
	position.x = player.position.x
