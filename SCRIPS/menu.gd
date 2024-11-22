extends Control




func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/level.tscn")

func _on_button_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://SCENES/credits.tscn")
