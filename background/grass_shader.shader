shader_type canvas_item;

uniform vec2 tiled_factor = vec2(1.0,1.0);
uniform float aspect_ratio = 0.6;
uniform bool paused = false;
uniform float cur_time = 0.0;

void fragment() {
	vec2 tiled_uvs = UV * tiled_factor;
	vec2 tile_offset;
	tile_offset = vec2(0.0,cur_time*-0.4);
	COLOR = texture(TEXTURE, tiled_uvs + tile_offset);
}