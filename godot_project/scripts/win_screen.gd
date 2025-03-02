extends Control

@onready var timer_label = $Background/MarginContainer/TitleBox/WinInfo/Timer

func _ready() -> void:
	timer_label.text = "Final Time: " + str(Global.seconds) + " seconds"

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
