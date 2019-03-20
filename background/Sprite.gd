tool
extends Sprite

var elapsed = 0.0
func _calculate_aspect_ratio():
	material.set_shader_param("aspect_ratio", scale.y / scale.x);

func _process(delta):
	if !get_tree().paused:
		elapsed += delta
		material.set_shader_param("cur_time", elapsed);