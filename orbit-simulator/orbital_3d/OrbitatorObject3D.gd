#@tool 
class_name Orbital3D 
extends Node3D 
@export_category("Tick Settings")
# Controla o tamanho de cada tick
@export_range(0.0, 1.0, 0.01) var tick_size:= 1.0
# A margen de aproximação para cada tick
@export_range(0.0, 0.1, 0.01) var margin_gap:= 0.05
@export_category("Orbital Settings")
# Ativa opções de estatico e olhar para ancora
@export var orbital_static:= true
@export var look_at_pivot:=true
# Ancora pivot
@export var orbital_pivot : OrbitalPivot3D
@export var orbital_plane:= OrbitPlane.xy
# Velocidade de orbita em graus e raio da orbita
@export var orbital_speed := 1.0
@export var orbital_radius:= 100.0


func  _ready() -> void:
	set_process(!orbital_static)
	if !orbital_pivot and !orbital_static:
		return
		
#=====================================================
# Angulo atual, valores de angulos e tipos de orbitas
#=====================================================
var orbital_angle:= 0.0
enum AngleValues{ MIN=0, MID=180, MAX=360 }
enum OrbitPlane{ xy=2, zy=3, xz=5}

#=====================================================
# ORBITAL PLANES ainda a implementar
#=====================================================
#=====================================================
# Cálculo de órbita por plano
#=====================================================
func orbit_xy(new_angle: float) -> Vector3:
	var referencial = orbital_pivot.global_position	
	referencial.x += sin(deg_to_rad(new_angle)) * orbital_radius
	referencial.y += cos(deg_to_rad(new_angle)) * orbital_radius
	return referencial
	
func orbit_zy(new_angle: float) -> Vector3:
	var referencial = orbital_pivot.global_position	
	referencial.z += sin(deg_to_rad(new_angle)) * orbital_radius
	referencial.y += cos(deg_to_rad(new_angle)) * orbital_radius
	return referencial	

func orbit_xz(new_angle: float) -> Vector3:
	var referencial = orbital_pivot.global_position	
	referencial.x += sin(deg_to_rad(new_angle)) * orbital_radius
	referencial.z += cos(deg_to_rad(new_angle)) * orbital_radius
	return referencial

#=======================================================
# TOOLS
#=======================================================	
func is_aprox(a: float, b: float, aprox := 1e-1) -> bool:
	var diff = abs(a - b)
	if diff < aprox:		
		var max_ab = max(abs(a), abs(b))		
		return (diff / max_ab < aprox) or (max_ab == 0.0) or (diff < aprox*0.9)
	return false
	
#==================================================
# UPDATE ANGLE implementando..
#==================================================

var cycles_count:=0

func orbitate(delta: float):
	orbit_update(delta)
	var new_position:= Vector3.ZERO	
	match orbital_plane:
		2: new_position= orbit_xy(orbital_angle)
		3: new_position = orbit_zy(orbital_angle)
		5: new_position = orbit_xz(orbital_angle)	
	self.visible = orbital_pivot.check_mass_colapse(new_position)	
	if visible:
		global_position = new_position
		if look_at_pivot:		
			look_at(orbital_pivot.global_position)	

func orbit_update(delta: float) -> void:
	orbital_angle = fmod(orbital_angle + orbital_speed * delta, AngleValues.MAX)	
	if is_aprox(orbital_angle, AngleValues.MAX):		
		cycles_count += 1			
	
func _process(delta: float) -> void:
	# RUN ORBIT
	orbitate(delta)	
	
	# DEBUG VIEW
	#print(global_position)
	""""		
	print(
	" Orbital Angle: ", orbital_angle, 
	" Cylcles: ", cycles_count, 
	" Ticks: ", tick_count, 
	" Tick Buffer: ", tick_buffer
	)"""
	
	
