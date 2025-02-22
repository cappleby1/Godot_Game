extends Control

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/Level1.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/UI/OptionsMenu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
