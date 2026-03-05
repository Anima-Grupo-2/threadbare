# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Node2D

@export var velocidadRotacion: float = 1.0

func _process(delta: float) -> void:
	rotation += velocidadRotacion * delta
