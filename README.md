# tricktools
A simple and flexible orbital simulation toolkit for Godot 4, featuring custom nodes for creating suns, planets, and other celestial bodies with realistic gravity, light intensity, and orbital motion.

Orbital System Tools for Godot 4

This project provides a set of custom GDScript tools designed to simulate orbital mechanics, dynamic lighting, and celestial motion inside the Godot Engine 4.
It allows developers to easily create stars, planets, and satellites that move and react according to mass, gravity, and distance, without needing manual setup every time.

🌀 Overview

The system is composed of modular nodes and scripts that can be attached to any Node3D to simulate orbiting behavior, light intensity variation, and mass-based acceleration.

Main components:

OrbitalPivot3D – defines the mass center and calculates gravitational acceleration based on distance.

Orbital3D – base class that manages orbit mechanics around a pivot.

OrbitalSun3D – extends Orbital3D to automatically create a light source and visual sphere (a star or sun).

Dynamic Visibility – objects can collapse or hide when reaching the center of mass.

Inclination Control – each body can define its own axis tilt, simulating real planetary rotation.

🌞 Example Usage
# Attach to a new Sun node
extends OrbitalSun3D

func _ready():
    _create_sun_visuals(radius := 4.0, color := Color(1.0, 0.9, 0.7))


Automatically, a sphere mesh and a directional light are created with adjustable properties like:

Size and emissive color

Light intensity and shadow control

Rotation and tilt

Gravity-based brightness variation

⚙️ Features

Physically inspired orbit simulation

Self-contained lighting system

Automatic sphere + light instantiation

Adjustable axis inclination

Mass-based gravitational acceleration

Easy to extend and integrate with other Godot nodes

🚀 Future Additions

Orbital decay and eccentricity simulation

Real-time orbital visualization gizmos

Environmental lighting adaptation

🧩 License

MIT License — free to use, modify, and distribute with attribution.
