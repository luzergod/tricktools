class_name OrbitalSun3D
extends Orbital3D

@export_category("Sun Visuals")
@export var sphere_radius := 25.0
@export var sphere_color := Color(1.0, 0.85, 0.4)
@export_category("Light Control")
@export var light_intensity := 40000.0
@export var light_color := Color(1.0, 0.95, 0.7)
@export var light_range := 2000.0
@export var show_sphere := true

var sun_mesh: MeshInstance3D
var sun_light: DirectionalLight3D

func _ready() -> void:
	super._ready()  # mantém a lógica orbital
	_create_sun_visuals()

func _create_sun_visuals() -> void:
	# Cria a esfera
	if show_sphere:
		sun_mesh = MeshInstance3D.new()
		sun_mesh.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var mesh = SphereMesh.new()
		mesh.radius = sphere_radius
		mesh.height = sphere_radius * 2.0
		mesh.radial_segments = 64
		mesh.rings = 32
		sun_mesh.mesh = mesh
		
		var material = StandardMaterial3D.new()
		material.albedo_color = sphere_color
		material.emission_enabled = true
		material.emission = sphere_color
		material.emission_energy_multiplier = 3.0
		material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		sun_mesh.material_override = material
		
		add_child(sun_mesh)

	# Cria a luz direcional
	sun_light = DirectionalLight3D.new()
	sun_light.light_color = light_color
	sun_light.light_energy = light_intensity
	sun_light.shadow_enabled = true
	sun_light.directional_shadow_max_distance = light_range

	add_child(sun_light)
	
	# Opcional: centraliza a luz dentro da esfera
	#sun_light.position = Vector3.ZERO
	#sun_light.rotation_degrees = Vector3(0, 0, 0)
