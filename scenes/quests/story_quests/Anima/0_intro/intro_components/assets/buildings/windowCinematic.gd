class_name windowCinematic
extends Node2D

signal cinematic_finished

@export var dialogue: DialogueResource = preload("res://scenes/quests/story_quests/Anima/0_intro/intro_components/dialog/tabernCinematic.dialogue")

@export var animation_player: AnimationPlayer

@export_file("*.tscn") var next_scene: String

@export var spawn_point_path: String

func _ready() -> void:
	if not GameState.intro_dialogue_shown:
		DialogueManager.show_dialogue_balloon(dialogue, "", [self])
		await DialogueManager.dialogue_ended
		cinematic_finished.emit()
		GameState.intro_dialogue_shown = true

	if next_scene:
		(
			SceneSwitcher
			. change_to_file_with_transition(
				next_scene,
				spawn_point_path,
				Transition.Effect.FADE,
				Transition.Effect.FADE,
			)
		)

#Cambiar la transicion a la escena llamada molino.scne
