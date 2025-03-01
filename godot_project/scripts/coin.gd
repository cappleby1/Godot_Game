extends Area2D

@onready var player_node = get_node("/root/Level1/Player")  

func _on_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	queue_free()  
	player_node.increase_score()  
