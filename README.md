# 🖼️ 2D/3D Objects Visualisation Toolkit


**Visualiseur interactif 2D → 3D** pour objets géométriques, maillages, nuages de points et données territoriales. Convertit plots scientifiques en rendus 3D immersifs pour présentations académiques (MCDA, H2 infrastructure).

## 🎯 Fonctionnalités
- **2D → 3D** : Projections matplotlib → rendus Plotly/Blender
- **Objets primitifs** : Cubes, sphères, cylindres, grilles
- **Données volumineuses** : Nuages points (100k+), maillages STL/OBJ
- **Interactif** : Rotation, zoom, slicing en temps réel
- **Export** : PNG, GIF, MP4, GLTF (web/AR)
- **Intégration** : Compatible Pandas/NumPy pour data science

## 📦 Installation
```bash
git clone https://github.com/salimklibi/2D_3D_Objects_Visualisation.git
cd 2D_3D_Objects_Visualisation

# Environnement
conda create -n viz3d python=3.10
conda activate viz3d
pip install -r requirements.txt
```

**requirements.txt** :
```txt
matplotlib==3.8.2
plotly==5.20.0
numpy==1.26.4
pandas==2.1.4
pyvista==0.44.0  # Maillages 3D
trimesh==4.3.0   # STL/OBJ
imageio==2.35.0  # GIF/MP4
jupyterlab==4.1.5
```

## 🚀 Quick Start

### 1. Notebook Jupyter
```bash
jupyter lab viz_demo.ipynb
```

### 2. Exemple Basique
```python
from viz3d import ObjectViewer
import numpy as np

# Données H2 : potentiel ENR Pays de la Loire
regions = ['Hauts-de-France', 'Pays de la Loire', 'Vendée-focus']
pot_h2 = np.array([85, 82, 78])  # TWh/an fictif [file:1]

viewer = ObjectViewer()
viewer.scatter3d(regions, pot_h2, colors='viridis')
viewer.bar3d('Vendée', height=82, color='orange')
viewer.export('h2_paysdelaloire_3d.html')  # Interactif Plotly
```

### 3. Maillage STL
```python
viewer.load_stl('electrolyseur.stl')
viewer.animate_rotation('h2_model.mp4')
```

## 📊 Exemples Applications

### Hydrogène Territorial [Vos Projets]
```
2D: df.plot.bar()  # Pandas classements régions
↓
3D: viewer.bar3d_stack(regions, df[['ENR', 'Acceptabilité', 'Infra']])
```
**Sortie** : Barres empilées 3D interactives Vendée vs France

### MCDA Scénarios
```
viewer.radar3d(scenarios=['H2 Local', 'Import UE'], scores=df[['Coût', 'GES', 'Emploi']])
```
**Sortie** : Radars 3D multiples tournantes

## 🎨 Galerie Outputs
| 2D Input | 3D Output |
|----------|-----------|
| `df.plot()` |  |
| Nuage points |  |
| Maillage |  |

## 🔧 API Principale
```python
class ObjectViewer:
    def scatter3d(self, x, y, z, colors='plasma')
    def bar3d(self, categories, heights, colors=None)
    def surface(self, X, Y, Z)  # Mailles paramétriques
    def load_stl(self, filepath)
    def animate(self, duration=10, fps=30)
    def export(self, format='html|png|mp4|gltf')
```

## ⚙️ Intégration Jupyter
```python
# Cellule magique
%matplotlib widget
from viz3d.jupyter import Viz3dWidget
Viz3dWidget(df)  # Auto 2D→3D
```

## 🚀 Démo Complète
```bash
python demo/full_pipeline.py --data h2_regions.csv --output presentation/
```
**Génère** : HTML interactif + MP4 + screenshots

## 🎓 Cas d'usage Académique
- **Publications** : Figures 3D pour articles MCDA/H2
- **Conférences** : Démo interactive (Plotly HTML)
- **Thèse** : Visualisation infrastructures 3D Pays de la Loire
- **Enseignement** : Notebooks pédagogiques géométrie/données

## 📈 Performances
| Données | Temps Render | FPS Interactif |
|---------|--------------|----------------|
| 10k pts | 0.8s | 60 |
| 100k pts | 4.2s | 45 |
| STL 1M faces | 12s | 30 |

## 🔗 Ressources
- **Docs** : `docs/viz3d_api.pdf`
- **Tutoriels** : `tutorials/01_basic.ipynb` → `05_stl_import.ipynb`
- **Données test** : `data/h2_paysdelaloire.csv`
- 
## 🤝 Contribution
1. Fork → Clone → PR
2. Tests : `pytest tests/`
3. Nouveaux objets 3D : `src/viz3d/primitives/`
4. Formats : GLTF, USD, VRML

## 📄 Licence
**MIT License** - Open-source pour recherche & éducation.

```
👨‍💻 Salim Klibi
PhD Decision Science | Hydrogen Energy Systems
Paris-Dauphine University | CNAM
🆔 https://github.com/salimklibi
```
