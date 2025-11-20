extends Node
class_name MainLevel

@export var _eggArea: Area2D
@export var _eggSprite: Sprite2D

var _eggHovered: bool = false


func _ready() -> void:
	_eggArea.mouse_entered.connect(func():
		_eggHovered = true
	)
	_eggArea.mouse_exited.connect(func():
		_eggHovered = false
	)


func _HandleClick() -> void:
	_eggSprite.texture = _GetTexture()


# TODO: Implement
func _GetTexture() -> Texture2D:
	return Texture2D.new()
	
	
func _input(event) -> void:
	if event is InputEventMouseButton:
		_HandleMouseInput(event)		
		
	
func _HandleMouseInput(event) -> void:
	if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		print("Mouse left click")

		if not _eggHovered:
			return
			
		print("Egg clicked")			
		
