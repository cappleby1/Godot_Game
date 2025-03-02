extends Area2D

@onready var player_node = get_node("/root/Level1/Player")  
@onready var coin_sound = $CoinSound

func _on_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	coin_sound.play()
	await get_tree().create_timer(0.1).timeout  
	queue_free()
	player_node.increase_score()
