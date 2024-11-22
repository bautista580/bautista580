extends CanvasLayer

var buttons: Array[Button]

func _ready() -> void:
	for button in $Content/Sections.get_children():
		buttons.append(button)
		# Conectamos la señal "pressed" de cada botón
		button.pressed.connect(_on_button_pressed.bind(button))

# Esta función se llamará cuando se presione cualquier botón
func _on_button_pressed(button: Button) -> void:
	if(button.text != 'Quake III'):
		get_tree().change_scene_to_file("res://SCENES/DERROTA.tscn")
	if(button.text == 'Quake III'):
		get_tree().change_scene_to_file("res://SCENES/VICTORIA.tscn")

#######################
#      IMPORTANTE      #
#  RESPUESTA CORRECTA: #
#		QUAKE III	   #
########################
