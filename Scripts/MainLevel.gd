extends Node
class_name MainLevel

@export var _eggArea: Area2D
@export var _eggSprite: Sprite2D
@export var _textureRepository: TextureRepository

var _eggHovered: bool             = false
var _eggStateId: Enums.EggStateId = Enums.EggStateId.Zero
var _eggId: Enums.EggId           = Enums.EggId.Plain


func _ready() -> void:
	_eggArea.mouse_entered.connect(func(): _eggHovered = true)
	_eggArea.mouse_exited.connect(func(): _eggHovered = false)


func _HandleClick() -> void:
	_IncrementEggState()
	_eggSprite.texture = _GetTexture(_eggId, _eggStateId)
	if (_eggStateId == Enums.EggStateId.Broken):
		# TODO: Handle egg breaking
		pass


func _IncrementEggState() -> void:
	match _eggStateId:
		Enums.EggStateId.Broken:
			pass
		_:
			_eggStateId = (_eggStateId + 1) as Enums.EggStateId


func _GetTexture(eggId: Enums.EggId, eggState: Enums.EggStateId) -> Texture2D:
	match eggId:
		Enums.EggId.Plain:
			match eggState:
				Enums.EggStateId.Zero: return _textureRepository.GetTexture(Enums.TextureId.Plain0)
				Enums.EggStateId.One: return _textureRepository.GetTexture(Enums.TextureId.Plain1)
				Enums.EggStateId.Two: return _textureRepository.GetTexture(Enums.TextureId.Plain2)
				Enums.EggStateId.Three: return _textureRepository.GetTexture(Enums.TextureId.Plain3)
				Enums.EggStateId.Four: return _textureRepository.GetTexture(Enums.TextureId.Plain4)
				Enums.EggStateId.Five: return _textureRepository.GetTexture(Enums.TextureId.Plain5)
				Enums.EggStateId.Broken: return _textureRepository.GetTexture(Enums.TextureId.PlainBroken)
		Enums.EggId.BrownSpotted:
			match eggState:
				Enums.EggStateId.Zero: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted0)
				Enums.EggStateId.One: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted1)
				Enums.EggStateId.Two: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted2)
				Enums.EggStateId.Three: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted3)
				Enums.EggStateId.Four: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted4)
				Enums.EggStateId.Five: return _textureRepository.GetTexture(Enums.TextureId.BrownSpotted5)
				Enums.EggStateId.Broken: return _textureRepository.GetTexture(Enums.TextureId.BrownSpottedBroken)
		Enums.EggId.Easter:
			match eggState:
				Enums.EggStateId.Zero: return _textureRepository.GetTexture(Enums.TextureId.Easter0)
				Enums.EggStateId.One: return _textureRepository.GetTexture(Enums.TextureId.Easter1)
				Enums.EggStateId.Two: return _textureRepository.GetTexture(Enums.TextureId.Easter2)
				Enums.EggStateId.Three: return _textureRepository.GetTexture(Enums.TextureId.Easter3)
				Enums.EggStateId.Four: return _textureRepository.GetTexture(Enums.TextureId.Easter4)
				Enums.EggStateId.Five: return _textureRepository.GetTexture(Enums.TextureId.Easter5)
				Enums.EggStateId.Broken: return _textureRepository.GetTexture(Enums.TextureId.EasterBroken)
	return _textureRepository.GetTexture(Enums.TextureId.Plain0)


func _input(event) -> void:
	if event is InputEventMouseButton:
		_HandleMouseInput(event)


func _HandleMouseInput(event) -> void:
	if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		print("Mouse left click")

		if not _eggHovered:
			return

		print("Egg clicked")			
		
