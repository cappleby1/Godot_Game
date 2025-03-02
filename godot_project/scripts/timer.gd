extends Node  

@onready var timer = $"."
@onready var label = $"../Player/VBoxContainer/TimerLabel"

func _ready() -> void:
	timer.wait_time = 1.0  
	timer.autostart = true  
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	label.text = "Time: " + str(Global.seconds)

func _on_timer_timeout() -> void:
	Global.seconds += 1  
	label.text = "Time: " + str(Global.seconds)  
