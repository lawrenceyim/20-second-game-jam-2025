class_name TextureRepository
extends Node

@export var _textures: Dictionary[Enums.TextureId, Texture2D]


func GetTexture(textureId: Enums.TextureId) -> Texture2D:
	return _textures[textureId]

