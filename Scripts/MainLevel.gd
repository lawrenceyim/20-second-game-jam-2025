extends Node
class_name MainLevel

@export var _eggArea: Area2D
@export var _eggSprite: Sprite2D

var _eggHovered: bool = false
var _eggStateId: Enums.EggStateId = Enums.EggStateId.Zero
var _eggId: Enums.EggId = Enums.EggId.PlaceHolder

func _ready() -> void:
	_eggArea.mouse_entered.connect(func():
		_eggHovered = true
	)
	_eggArea.mouse_exited.connect(func():
		_eggHovered = false
	)


func _HandleClick() -> void:
	_eggSprite.texture = _GetTexture(_eggId, _eggStateId)


# TODO: Implement
func _GetTexture(eggId: Enums.EggId, eggState: Enums.EggStateId) -> Texture2D:
	match _eggId:
		Enums.EggId.PlaceHolder:
			match _eggStateId: 
				Enums.EggStateId.Zero: 
					return Texture2D.new() 
				Enums.EggStateId.One:
					return Texture2D.new()
				Enums.EggStateId.Two:
					return Texture2D.new()
				Enums.EggStateId.Three:
					return Texture2D.new()
				Enums.EggStateId.Four:
					return Texture2D.new()
	
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
		
