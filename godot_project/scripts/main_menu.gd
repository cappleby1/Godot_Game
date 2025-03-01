extends Control

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/OptionsMenu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	pass # Replace with function body.
