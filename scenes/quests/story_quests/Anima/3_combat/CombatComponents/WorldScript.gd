# SPDX-FileCopyrightText: The Threadbare Authors
# SPDX-License-Identifier: MPL-2.0
extends Node2D

@export var curva_roja: Curve
@export var curva_verde: Curve
@export var curva_azul: Curve

@export_range(0.0, 24.0) var hora_actual: float = 12.0
@export var velocidad_tiempo: float = 1.0

@onready var filtro = $FiltroDiaNoche

func _process(delta: float) -> void:

	hora_actual += delta * velocidad_tiempo
	if hora_actual >= 24.0:
		hora_actual = 0.0

	var tiempo_grafica = hora_actual / 24.0
	
	if curva_roja and curva_verde and curva_azul:
		var r = curva_roja.sample(tiempo_grafica)
		var g = curva_verde.sample(tiempo_grafica)
		var b = curva_azul.sample(tiempo_grafica)
		filtro.color = Color(r, g, b)
