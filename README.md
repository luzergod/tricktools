# 🌌 Godot Orbital Toolkit

A simple and flexible orbital simulation toolkit for **Godot 4**.

This toolkit allows you to easily create and simulate **suns, planets, and other orbital bodies** with realistic motion, lighting, and gravitational effects.  
Designed for developers who want to build dynamic space environments with minimal setup.

---

## 🚀 Features

- 🪐 Custom orbiting system (with 3D pivot control)
- ☀️ Automatic light and mesh generation for suns
- 🌍 Axis tilt support for planets and other bodies
- ⚖️ Mass-based gravity and acceleration
- 💡 Environment and light intensity integration
- 🎮 Lightweight and performance-friendly

---

## 🔧 Usage

1. Add the provided scripts (`OrbitalPivot3D.gd`, `Orbitator3D.gd`, `OrbitalSun3D.gd`, etc.) to your Godot project.  
2. Create a new scene with a **Node3D** as the root.  
3. Attach an **OrbitalPivot3D** to serve as the gravitational center.  
4. Add one or more **Orbitator3D** or **OrbitalSun3D** nodes as children of the pivot.  
5. Adjust orbit parameters like:
   - `orbital_radius`
   - `orbital_speed`
   - `orbital_plane`
   - `look_at_pivot`
6. Press **Play** and watch your celestial system come to life.

---

## ⚙️ Example Structure

Root
├── OrbitalPivot3D
│ ├── OrbitalSun3D
│ ├── Orbitator3D (Planet)
│ └── Orbitator3D (Moon)

yaml
Copiar código

---

## 📜 License

MIT License — free to use and modify.

---

Created by **Geliardi S. Oliveira**  
🧭 Explore. Simulate. Illuminate.
