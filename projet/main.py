import os
import vtk
from visualisation_2d import visualize_2d
from visualisation_3d import visualize_3d

# Chemin vers le répertoire contenant les images
directory_path = "/Users/salim/Desktop/PFE/M2/standard_test_images"

# Liste pour stocker les chemins des fichiers images
file_paths = []

# Parcourir tous les fichiers du répertoire
for filename in os.listdir(directory_path):
    # Vérifier si le fichier a une extension TIFF ou NRRD
    if filename.endswith('.tiff') or filename.endswith('.tif') or filename.endswith('.nrrd'):
        # Ajouter le chemin complet du fichier à la liste
        file_paths.append(os.path.join(directory_path, filename))

# Liste pour stocker les données des images chargées
image_data_list = []

# Parcourir la liste des chemins des fichiers images
for file_path in file_paths:
    # Créer un lecteur approprié en fonction de l'extension du fichier
    if file_path.endswith('.tiff') or file_path.endswith('.tif'):
        reader = vtk.vtkTIFFReader()
    elif file_path.endswith('.nrrd'):
        reader = vtk.vtkNrrdReader()

    # Configuration du lecteur avec le chemin du fichier
    reader.SetFileName(file_path)
    reader.Update()

    # Ajouter les données de l'image chargée à la liste
    image_data_list.append(reader.GetOutput())

# Création des visualisations 2D et 3D
renderer_2d = vtk.vtkRenderer()
renderer_3d = vtk.vtkRenderer()

# Parcourir les données des images chargées
for image_data in image_data_list:
    # Créer les acteurs pour la visualisation en 2D et 3D
    actor_2d = visualize_2d(image_data)
    actor_3d = visualize_3d(image_data)

    # Ajouter les acteurs aux renderers respectifs
    renderer_2d.AddActor(actor_2d)
    renderer_3d.AddActor(actor_3d)

# Création de la fenêtre de rendu et ajout des renderers
render_window = vtk.vtkRenderWindow()
render_window.SetSize(1200, 600)  # Taille de la fenêtre
render_window.AddRenderer(renderer_2d)
render_window.AddRenderer(renderer_3d)

# Création de l'interactor
interactor = vtk.vtkRenderWindowInteractor()
interactor.SetRenderWindow(render_window)

# Création d'un style de caméra
style = vtk.vtkInteractorStyleTrackballCamera()
interactor.SetInteractorStyle(style)

# Affichage de la fenêtre de rendu
render_window.Render()
interactor.Start()
