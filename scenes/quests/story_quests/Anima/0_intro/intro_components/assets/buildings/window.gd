# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Node2D

@export var size := Vector2(40, 40)
@export var pulse_speed := 2.0
@export var pulse_strength := 0.25

var time_passed := 0.0

func _process(delta: float) :
	time_passed += delta
	queue_redraw()

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, size)

	var pulse := (sin(time_passed * pulse_speed) + 1.0) / 2.0
	
	var dark_violet := Color(0.05, 0.0, 0.08)
	var bright_violet := Color(0.6, 0.2, 1.0)
	
	var window_color := dark_violet.lerp(bright_violet, pulse)

	draw_circle(rect.size / 2, 70, Color(0.6, 0.2, 1.0, 0.08 + pulse * 0.12))
	draw_circle(rect.size / 2, 55, Color(0.6, 0.2, 1.0, 0.15 + pulse * 0.2))
	draw_rect(rect, window_color)
	draw_rect(Rect2(0, 0, size.x, size.y / 3), Color(1, 1, 1, 0.05))
	draw_rect(rect, Color(0.35, 0.2, 0.1), false, 2)
