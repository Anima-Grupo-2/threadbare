# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Area2D

var taberna_path: String = "res://scenes/quests/story_quests/Anima/0_intro/Taberna.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		SceneSwitcher.change_to_file_with_transition(
			taberna_path,
			"", 
			Transition.Effect.FADE,
			Transition.Effect.FADE
		)
