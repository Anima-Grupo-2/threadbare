# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn = get_node("DoorSpawn")
	$Player.global_position = spawn.global_position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
