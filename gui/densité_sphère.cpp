#include <vtkSmartPointer.h>
#include <vtkImageData.h>
#include <vtkTIFFReader.h>
#include <vtkNrrdReader.h>
#include <vtkDoubleArray.h>
#include <vtkMath.h>
#include <vtkPointData.h>
#include <vtkSmartPointer.h>
#include <iostream>

void calculateDensity(const std::vector<std::string>& imagePaths, int currentImageIndex)
{
    // Charger l'image à l'index spécifié
    std::string image_path = imagePaths[currentImageIndex];

    // Lire l'image avec VTK en fonction de son extension
    vtkSmartPointer<vtkImageData> imageData;
    if (image_path.find(".tif") != std::string::npos || image_path.find(".tiff") != std::string::npos)
    {
        vtkSmartPointer<vtkTIFFReader> reader = vtkSmartPointer<vtkTIFFReader>::New();
        reader->SetFileName(image_path.c_str());
        reader->Update();
        imageData = reader->GetOutput();
    }
    else if (image_path.find(".nrrd") != std::string::npos)
    {
        vtkSmartPointer<vtkNrrdReader> reader = vtkSmartPointer<vtkNrrdReader>::New();
        reader->SetFileName(image_path.c_str());
        reader->Update();
        imageData = reader->GetOutput();
    }
    else
    {
        std::cerr << "Format non pris en charge. Le format d'image n'est pas pris en charge." << std::endl;
        return;
    }

    // Convertir l'image VTK en tableau numpy
    int* dimensions = imageData->GetDimensions();
    vtkSmartPointer<vtkDataArray> scalars = imageData->GetPointData()->GetScalars();
    double* image_array = static_cast<double*>(scalars->GetVoidPointer(0));

    // Trouver le centre de la sphère (hypothétiquement au centre de l'image)
    int center[3] = { dimensions[0] / 2, dimensions[1] / 2, dimensions[2] / 2 };

    // Définir la taille de la fenêtre pour le voisinage
    int window_size = 3;
    int half_window = window_size / 2;

    // Calculer la densité du voisinage des pixels de la surface vers le centre de la sphère
    std::vector<double> density_values;
    for (int z = 0; z < dimensions[2]; ++z)
    {
        for (int y = 0; y < dimensions[1]; ++y)
        {
            for (int x = 0; x < dimensions[0]; ++x)
            {
                // Vérifier si le pixel est à l'intérieur de l'image
                if (x >= 0 && x < dimensions[0] && y >= 0 && y < dimensions[1] && z >= 0 && z < dimensions[2])
                {
                    // Calculer le vecteur du pixel vers le centre
                    int vector_x = x - center[0];
                    int vector_y = y - center[1];
                    int vector_z = z - center[2];

                    // Calculer la distance entre le pixel et le centre
                    double distance = vtkMath::Norm(vector_x, vector_y, vector_z);

                    // Vérifier si le pixel est dans le voisinage
                    if (distance <= half_window)
                    {
                        density_values.push_back(image_array[z * dimensions[1] * dimensions[0] + y * dimensions[0] + x]);
                    }
                }
            }
        }
    }

    // Afficher le vecteur de densité du voisinage
    std::cout << "Vecteur de densité :\n";
    for (size_t i = 0; i < density_values.size(); ++i)
    {
        std::cout << density_values[i] << " ";
    }
    std::cout << std::endl;
}

int main()
{
    // Exemple d'utilisation de la fonction calculateDensity
    std::vector<std::string> imagePaths = { "/Users/salim/Desktop/PFE/sphere" };
    int currentImageIndex = 0;
    calculateDensity(imagePaths, currentImageIndex);

    return 0;
}
