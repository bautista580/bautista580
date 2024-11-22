extends Area2D

func on_player_interaction(player_position):
	# Calcular la diferencia de posición entre el jugador y la puerta
	var position_difference = player_position - global_position

	# Imprimir la diferencia de posición para depuración
	print("Posición del jugador: ", player_position)
	print("Posición de la puerta: ", global_position)
	print("Diferencia de posición: ", position_difference)
	
	
	# Aquí puedes agregar lógica adicional basada en la diferencia de posición
	if abs(position_difference.x) < 100 and abs(position_difference.y) < 100:
		# Lógica de interacción con la puerta
			get_tree().change_scene_to_file("res://main.tscn")
