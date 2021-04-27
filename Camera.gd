extends Camera2D

export (int) var maxOffsetX = 200;
export (int) var maxOffsetY = 200;
export (float) var cameraSpeed = 2;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (String) var playerPath = "../Player";
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(playerPath);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var diff = player.position - offset;
	if (abs(diff.x) > maxOffsetX || abs(diff.y) > maxOffsetY):
		offset = offset.linear_interpolate(player.position, delta * cameraSpeed);
#	pass
