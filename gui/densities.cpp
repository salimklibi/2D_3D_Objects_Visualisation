#include <vtkSmartPointer.h>
#include <vtkImageData.h>
#include <vtkTIFFReader.h>
#include <vtkNrrdReader.h>
#include <vtkImageReslice.h>
#include <vtkPointData.h>
#include <vtkSmartPointer.h>
#include <vtkDoubleArray.h>
#include <vtkImageIterator.h>
#include <vtkMath.h>
#include <vtkMessageBox.h>
#include <vtkImageReader2.h>
#include <vtkImageReader2Factory.h>
#include <iostream>
#include <vector>
#include <cmath>

void calculate_average_density_to_center()
{
    // Charger l'image à l'index spécifié
    std::string image_path = this->image_paths[this->current_image_index];

    vtkSmartPointer<vtkImageReader2> reader;
    if (image_path.find(".tif") != std::string::npos || image_path.find(".tiff") != std::string::npos) {
        reader = vtkSmartPointer<vtkTIFFReader>::New();
    } else if (image_path.find(".nrrd") != std::string::npos) {
        reader = vtkSmartPointer<vtkNrrdReader>::New();
    } else {
        std::cerr << "Format non pris en charge" << std::endl;
        return;
    }

    reader->SetFileName(image_path.c_str());
    reader->Update();

    // Obtenir les données de l'image
    vtkSmartPointer<vtkImageData> image_data = reader->GetOutput();

    // Obtenir les dimensions de l'image
    int* dimensions = image_data->GetDimensions();
    int image_array_size = dimensions[0] * dimensions[1] * dimensions[2];

    // Convertir l'image VTK en tableau numpy
    std::vector<float> image_array(image_array_size);
    for (int z = 0; z < dimensions[2]; ++z) {
        for (int y = 0; y < dimensions[1]; ++y) {
            for (int x = 0; x < dimensions[0]; ++x) {
                image_array[z * dimensions[1] * dimensions[0] + y * dimensions[0] + x] = image_data->GetScalarComponentAsFloat(x, y, z, 0);
            }
        }
    }

    // Trouver le centre de la sphère (hypothétiquement au centre de l'image)
    int center[3] = { dimensions[0] / 2, dimensions[1] / 2, dimensions[2] / 2 };

    // Créer un masque circulaire sur l'image
    int radius = std::min({ dimensions[0], dimensions[1], dimensions[2] }) / 2;
    std::vector<int> mask(image_array_size, 0);
    for (int z = 0; z < dimensions[2]; ++z) {
        for (int y = 0; y < dimensions[1]; ++y) {
            for (int x = 0; x < dimensions[0]; ++x) {
                double distance_to_center = std::sqrt(std::pow(x - center[0], 2) + std::pow(y - center[1], 2) + std::pow(z - center[2], 2));
                if (distance_to_center <= radius) {
                    mask[z * dimensions[1] * dimensions[0] + y * dimensions[0] + x] = 1;
                }
            }
        }
    }

    // Définir la taille de la fenêtre pour le voisinage
    int window_size = 3;
    int half_window = window_size / 2;

    // Calculer la densité du voisinage des pixels de la surface vers le centre de la sphère
    std::vector<float> density_values;
    for (int z = 0; z < dimensions[2]; ++z) {
        for (int y = 0; y < dimensions[1]; ++y) {
            for (int x = 0; x < dimensions[0]; ++x) {
                // Vérifier si le voxel est à l'intérieur du masque circulaire
                if (mask[z * dimensions[1] * dimensions[0] + y * dimensions[0] + x] == 1) {
                    // Calculer le vecteur du voxel vers le centre
                    int vector_x = x - center[0];
                    int vector_y = y - center[1];
                    int vector_z = z - center[2];
                    // Calculer la distance entre le voxel et le centre
                    double distance = std::sqrt(std::pow(vector_x, 2) + std::pow(vector_y, 2) + std::pow(vector_z, 2));

                    // Vérifier si le voxel est dans le voisinage
                    if (distance <= half_window) {
                        density_values.push_back(image_array[z * dimensions[1] * dimensions[0] + y * dimensions[0] + x]);
                    }
                }
            }
        }
    }

    // Afficher la liste de densité du voisinage
    std::cout << "Liste de densités : ";
    for (const auto& density : density_values) {
        std::cout << density << " ";
    }
    std::cout << std::endl;
}

void calculate_average_density_on_surface()
{
    // Charger l'image à l'index spécifié
    std::string image_path = "chemin/vers/votre/image";
    vtkSmartPointer<vtkImageReader2> reader;
    if (image_path.find(".tif") != std::string::npos || image_path.find(".tiff") != std::string::npos) {
        reader = vtkSmartPointer<vtkTIFFReader>::New();
    } else if (image_path.find(".nrrd") != std::string::npos) {
        reader = vtkSmartPointer<vtkNrrdReader>::New();
    } else {
        std::cerr << "Format non pris en charge" << std::endl;
        return;
    }

    reader->SetFileName(image_path.c_str());
    reader->Update();

     // Obtenir les données de l'image
    vtkSmartPointer<vtkImageData> image_data = reader->GetOutput();

    // Convertir l'image VTK en tableau numpy
    int* dims = image_data->GetDimensions();
    int nvoxels = dims[0] * dims[1] * dims[2];
    double* image_array = static_cast<double*>(image_data->GetScalarPointer());

    // Créer un masque circulaire sur l'image
    int center[3] = { dims[0] / 2, dims[1] / 2, dims[2] / 2 };
    int radius = std::min({ dims[0], dims[1], dims[2] }) / 2;

    // Récupérer les valeurs des voxels dans la surface
    std::vector<double> surface_voxel_values;
    for (int z = 0; z < dims[2]; ++z) {
        for (int y = 0; y < dims[1]; ++y) {
            for (int x = 0; x < dims[0]; ++x) {
                int distance_to_center = std::sqrt(std::pow(x - center[0], 2) + std::pow(y - center[1], 2) + std::pow(z - center[2], 2));
                if (distance_to_center <= radius) {
                    surface_voxel_values.push_back(image_array[z * dims[0] * dims[1] + y * dims[0] + x]);
                }
            }
        }
    }

    // Calculer la densité moyenne des voxels dans la surface
    double sum = 0.0;
    for (const auto& value : surface_voxel_values) {
        sum += value;
    }
    double average_density = sum / surface_voxel_values.size();

    // Afficher la densité moyenne
    std::cout << "Densité moyenne dans la surface : " << average_density << std::endl;
}
