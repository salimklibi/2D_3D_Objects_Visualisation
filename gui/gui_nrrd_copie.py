import os
import cv2
from PyQt5.QtWidgets import QApplication, QMainWindow, QVBoxLayout, QWidget, QLabel, QPushButton, QHBoxLayout, QProgressBar, QLineEdit, QMessageBox
from PyQt5.QtGui import QPixmap, QImage
from PyQt5.QtCore import Qt
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import vtk
from vtk.util.numpy_support import vtk_to_numpy
from numpy import array




class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.current_image_index = 0
        self.image_paths = self.load_images("/Users/salim/Desktop/PFE/M2/standard_test_images") 
        # self.image_paths = self.load_images("/Users/salim/Desktop/PFE/M2/images/jp2")
        # self.image_paths = self.load_images("/Users/salim/Desktop/PFE/43.67um_pomelos1_pag-0.08_0.24_jp2_") 
        self.image_paths = self.load_images("/Users/salim/Desktop/PFE")
        # self.image_paths = self.load_images("/Users/salim/Desktop/PFE/HA1000_8um_pomelo2_01_pag-0.27_0.29_jp2-10_") 
        # self.image_paths = self.load_images("/Users/salim/Desktop/PFE/m") 
        self.image_paths = self.load_images("/Users/salim/Desktop/PFE/sphere") 
   

        self.num_images = len(self.image_paths)

        self.initUI()
    def calculate_density(self, x, y, z):
        # Cette fonction prend les coordonnées x, y, z du point et retourne la densité de la peau
        # Voici un exemple de fonction qui retourne une densité aléatoire pour le point donné
        return np.random.random()
        
    # def calculate_density(self, x, y, z):
    # # Implémentez une fonction pour calculer la densité de la peau
    # # Ici, vous pouvez simplement retourner une valeur constante pour les tests
    #     return 0.5  # Par exemple, la densité est de 0.5 pour tous les points


        # self.calculate_skin_density()

    def initUI(self):
        self.setWindowTitle("Visualization")
        self.setGeometry(100, 100, 800, 600)  # Taille initiale de la fenêtre

        # Créer un QLabel pour afficher l'image
        self.image_label = QLabel()
        self.image_label.setAlignment(Qt.AlignCenter)  # Centrer l'image dans le QLabel

        # Créer un QLabel pour afficher le numéro de l'image
        self.image_number_label = QLabel("Image 1 / {}".format(self.num_images))
        self.image_number_label.setAlignment(Qt.AlignCenter)  # Centrer l'image dans le QLabel

        # Créer une barre de progression
        self.progress_bar = QProgressBar()
        self.progress_bar.setMaximum(self.num_images - 1)
        # Créer un QLineEdit pour saisir le numéro de l'image
        self.image_number_edit = QLineEdit()
        self.image_number_edit.setPlaceholderText("Numéro de l'image")
        self.image_number_edit.returnPressed.connect(self.go_to_image)
        # Créer un bouton pour aller à l'image voulue
        go_to_button = QPushButton("Aller à l'image")
        go_to_button.clicked.connect(self.go_to_image)
        # Créer des boutons pour naviguer entre les images
        prev_button = QPushButton("Précédent")
        prev_button.clicked.connect(self.show_previous_image)
        next_button = QPushButton("Suivant")
        next_button.clicked.connect(self.show_next_image)
        # # Bouton pour segmenter l'image avec la segmentation d'Otsu
        segment_button = QPushButton("Segmenter")
        segment_button.clicked.connect(self.segmentation_otsu)

        # Créer un layout horizontal pour les boutons de navigation
        button_layout = QHBoxLayout()
        button_layout.addWidget(prev_button)
        button_layout.addWidget(next_button)
        # Ajouter le bouton de segmentation
        button_layout.addWidget(segment_button)

        # Créer un bouton pour afficher l'image en 2D
        show_2d_button = QPushButton("Afficher en 2D")
        show_2d_button.clicked.connect(self.show_2d_image)

        # Créer un bouton pour afficher l'image en 3D
        show_3d_button = QPushButton("Afficher en 3D")
        show_3d_button.clicked.connect(self.show_3d_image)

        # # Créer un bouton pour calculer la densité du pixel
        # density_button = QPushButton("Calculer densité")
        # density_button.clicked.connect(self.calculate_skin_density)
        # button_layout.addWidget(density_button)

        # Créer un bouton pour extraire et afficher la densité de la peau le long des normales
        extract_density_button = QPushButton("Extraire densité de peau")
        extract_density_button.clicked.connect(self.show_skin_density_along_normals)
        button_layout.addWidget(extract_density_button)

        # Ajouter les boutons d'affichage en 2D et 3D
        button_layout.addWidget(show_2d_button)
        button_layout.addWidget(show_3d_button)
        # Créer un layout horizontal pour le champ de texte et le bouton "Aller à l'image"
        text_box_layout = QHBoxLayout()
        text_box_layout.addWidget(self.image_number_edit)
        text_box_layout.addWidget(go_to_button)
        # Créer un layout vertical pour la fenêtre principale
        layout = QVBoxLayout()
        layout.addWidget(self.image_label)
        layout.addWidget(self.image_number_label)
        layout.addWidget(self.progress_bar)
        layout.addLayout(text_box_layout)
        layout.addLayout(button_layout)

        # Créer un widget pour contenir le layout
        central_widget = QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)

        # Afficher la première image
        self.show_image(self.current_image_index)

    def load_images(self, directory):
        image_paths = []
        for filename in os.listdir(directory):
            if filename.endswith(".tiff") or filename.endswith(".tif") or filename.endswith(".jp2") or filename.endswith(".nrrd"):
                image_paths.append(os.path.join(directory, filename))
        return image_paths

    def show_image(self, index):
        # Charger l'image à l'index spécifié
        image_path = self.image_paths[index]
        image = cv2.imread(image_path)
         # Vérifier si l'image a été correctement lue
        if image is not None:
            height, width, _ = image.shape
            pixmap = QPixmap(image_path)

            # Ajuster la taille de l'image pour qu'elle s'adapte à la fenêtre tout en conservant les proportions
            scaled_pixmap = pixmap.scaled(self.image_label.size(), Qt.KeepAspectRatio)

            # Afficher l'image dans le QLabel
            self.image_label.setPixmap(scaled_pixmap)

            # Mettre à jour la barre de progression
            self.progress_bar.setValue(index)

            # Mettre à jour le numéro de l'image affichée
            self.image_number_label.setText("Image {} / {}".format(index + 1, self.num_images))

    def show_previous_image(self):
        # Afficher un message d'avertissement s'il n'y a pas d'image avant la première
        if self.current_image_index > 0:
            self.current_image_index -= 1
            self.show_image(self.current_image_index)
        else:
            QMessageBox.warning(self, "Attention", "Il n'y a pas d'image avant la première")

    def show_next_image(self):
        # Afficher un message d'avertissement s'il n'y a pas d'image après la dernière
        if self.current_image_index < self.num_images - 1:
            self.current_image_index += 1
            self.show_image(self.current_image_index)
        else:
            QMessageBox.warning(self, "Attention", "Il n'y a pas d'image après la dernière")

    def go_to_image(self):
        try:
            index = int(self.image_number_edit.text()) - 1
            if 0 <= index < self.num_images:
                self.current_image_index = index
                self.show_image(self.current_image_index)
            else:
                QMessageBox.warning(self, "Attention", "Numéro d'image invalide")
        except ValueError:
            QMessageBox.warning(self, "Attention", "Numéro d'image invalide")

    def segmentation_otsu(self):
            # Charger l'image à l'index spécifié
            image_path = self.image_paths[self.current_image_index]
            image = cv2.imread(image_path)

            # Convertir l'image en niveaux de gris
            gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

            # Appliquer la segmentation d'Otsu
            _, segmented_image = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
            # Trouver le plus petit cercle englobant pour obtenir le rayon
            contours, _ = cv2.findContours(segmented_image, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
            if contours:
                (x, y), radius = cv2.minEnclosingCircle(contours[0])
                center = (int(x), int(y))
                radius = int(radius)

                # Créer un masque circulaire
                mask = np.zeros_like(segmented_image)
            # Créer un masque circulaire
            height, width = segmented_image.shape
            mask = np.zeros((height, width), dtype=np.uint8)
            center = (width // 2, height // 2)
            radius = min(width, height) // 2
            cv2.circle(mask, center, radius, (255, 255, 255), -1)
            # Appliquer le masque à l'image segmentée
            segmented_image = cv2.bitwise_and(segmented_image, segmented_image, mask=mask)
            # Afficher l'image segmentée
            cv2.imshow("Segmented Image (Otsu) - Cropped", segmented_image)
            cv2.waitKey(0)
            cv2.destroyAllWindows()         

    def extract_skin_density_along_normals(self, surface_points, surface_normals):
        if surface_normals is None:
            print("Les normales ne sont pas disponibles. Impossible de calculer la densité de la peau.")
            return []

        skin_density_along_normals = []

        for point, normal in zip(surface_points, surface_normals):
            # Déplacez-vous le long de la normale dans les deux sens
            for direction in [-1, 1]:
                # Déplacez-vous le long de la normale sur une certaine distance
                distance = 20  # Vous pouvez ajuster cette distance selon vos besoins
                new_point = [point[i] + direction * distance * normal[i] for i in range(3)]  # Assurez-vous d'avoir une coordonnée z si vous êtes en 3D

                # Calculez la densité de la peau à ce nouveau point en utilisant calculate_density
                skin_density = self.calculate_density(*new_point)  

                # Ajoutez la densité de la peau à la liste
                skin_density_along_normals.append(skin_density)

        return skin_density_along_normals


    def show_skin_density_along_normals(self):
        # Obtenez le chemin du fichier du modèle
        model_path = self.image_paths[self.current_image_index]

        # Obtenez les points de surface et les normales
        surface_points, surface_normals = self.get_surface_points_and_normals(model_path)

        # Extraire la densité de la peau le long des normales
        skin_density_along_normals = self.extract_skin_density_along_normals(surface_points, surface_normals)

        # Afficher la densité de la peau
        QMessageBox.information(self, "Densité de la peau le long des normales", f"Densité de la peau le long des normales :\n{skin_density_along_normals}")


    def get_surface_points_and_normals(self, model_path):
        image_path = self.image_paths[self.current_image_index]
        if image_path.endswith(".tif") or image_path.endswith(".tiff"):
            reader = vtk.vtkTIFFReader()
        elif image_path.endswith(".nrrd"):
            reader = vtk.vtkNrrdReader()
        else:
            QMessageBox.warning(self, "Format non pris en charge", "Le format d'image n'est pas pris en charge.")
            return

        reader.SetFileName(image_path)
        reader.Update()

        # Filtrer les points de surface
        surface_filter = vtk.vtkDataSetSurfaceFilter()
        surface_filter.SetInputConnection(reader.GetOutputPort())
        surface_filter.Update()

        # Récupérer les points de surface
        surface_points = surface_filter.GetOutput().GetPoints()

        # Calculer les normales à la surface
        normals = vtk.vtkPolyDataNormals()
        normals.SetInputConnection(surface_filter.GetOutputPort())
        normals.ComputePointNormalsOn()
        normals.Update()

        surface_normals = normals.GetOutput().GetPointData().GetNormals()

        # Convertir les points de surface en une liste de tuples
        surface_points_list = [surface_points.GetPoint(i) for i in range(surface_points.GetNumberOfPoints())]

        # Convertir les normales de VTKArray à une liste de tuples
        surface_normals_list = [surface_normals.GetTuple(i) for i in range(surface_normals.GetNumberOfTuples())]

        return surface_points_list, surface_normals_list

    
    def show_2d_image(self):
        image_path = self.image_paths[self.current_image_index]
        image = cv2.imread(image_path)
        cv2.imshow("Image 2D", image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
 
    @staticmethod
    def show_3d_image():
        # Chemin vers les images
        directory_path = "/Users/salim/Desktop/PFE/m"
        directory_path = "/Users/salim/Desktop/PFE/sphere"

        image_paths = []

        # Parcourir tous les fichiers du répertoire
        for filename in os.listdir(directory_path):
            if filename.endswith(".tiff") or filename.endswith(".tif") or filename.endswith(".jp2") or filename.endswith(".nrrd"):
                image_paths.append(os.path.join(directory_path, filename))

        # Création du volume
        volume = vtk.vtkImageData()
        reader = vtk.vtkTIFFReader()
        reader = vtk.vtkNrrdReader()

        for image_path in image_paths:
            reader.SetFileName(image_path)
            reader.Update()
            image_data = reader.GetOutput()
            volume.DeepCopy(image_data)

        # Création du mapper pour le volume
        volume_mapper = vtk.vtkSmartVolumeMapper()
        volume_mapper.SetInputData(volume)

        # Création de l'acteur pour le volume
        volume_actor = vtk.vtkVolume()
        volume_actor.SetMapper(volume_mapper)

        # Création du rendu et ajout de l'acteur
        renderer = vtk.vtkRenderer()
        renderer.AddActor(volume_actor)

        # Création de la fenêtre de rendu et ajout du rendu
        render_window = vtk.vtkRenderWindow()
        render_window.AddRenderer(renderer)

        # Création de l'interactor
        interactor = vtk.vtkRenderWindowInteractor()
        interactor.SetRenderWindow(render_window)

        # Configuration du style d'interaction
        #style = vtk.vtkInteractorStyleTrackballCamera()
        #interactor.SetInteractorStyle(style)

        # Affichage de la fenêtre de rendu
        render_window.Render()
        interactor.Start()

if __name__ == "__main__":
    app = QApplication([])
    window = MainWindow()
    window.show()
    app.exec_()
