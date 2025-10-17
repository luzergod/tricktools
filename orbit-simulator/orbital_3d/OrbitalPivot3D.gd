class_name OrbitalPivot3D
extends Orbital3D

@export_category("Orbital Pivot Settings")
@export var mass_center := MassCenter.xy
@export var negative_mass := true

enum MassCenter { xy = -10, xz = 5, zy = 10, xyz = 100 }

func check_mass_colapse(orbitator: Vector3) -> bool:
	if not negative_mass:
		return true		
	match mass_center:
		MassCenter.xz:
			return orbitator.z >= global_position.z
		MassCenter.zy, MassCenter.xy:
			return orbitator.y >= global_position.y
		MassCenter.xyz:
			return not orbitator.is_equal_approx(global_position)
			
	return true
