extends Node  

@onready var timer = $"."
@onready var label = $"../Player/TimerLabel"  

var seconds = 0  

func _ready() -> void:
	timer.wait_time = 1.0  
	timer.autostart = true  
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	label.text = "Time: " + str(seconds)

func _on_timer_timeout() -> void:
	seconds += 1  
	label.text = "Time: " + str(seconds)  
