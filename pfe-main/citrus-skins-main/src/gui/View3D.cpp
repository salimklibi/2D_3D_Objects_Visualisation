#include <vtkActor.h>
#include <vtkCamera.h>
#include <vtkDataSetMapper.h>
#include <vtkImageData.h>
#include <vtkNamedColors.h>
#include <vtkNew.h>
#include <vtkProperty.h>
#include <vtkRenderWindow.h>
#include <vtkRenderWindowInteractor.h>
#include <vtkRenderer.h>

#include <vtkSmartPointer.h>
#include <vtkNrrdReader.h>
#include <vtkImageViewer2.h>

#include <vtkImageActor.h>
#include <vtkImageMapper3D.h>

#include <QDebug>

#include "View3D.h"

View3D::View3D(QWidget *parent)
    :QMainWindow(parent)
{

}

void View3D::createView3D() {

    vtkSmartPointer<vtkNrrdReader> reader = vtkSmartPointer<vtkNrrdReader>::New();
    reader->SetFileName("../sphere_image.nrrd"); // à changer suivant ou le fichier se trouve
    reader->Update();

    // Obtenir les données de l'image
    vtkSmartPointer<vtkImageData> imageData = reader->GetOutput();

    int* dims = imageData->GetDimensions();
    std::cout << "Dimensions: " << dims[0] << " " << dims[1] << " " << dims[2] << std::endl;

    qDebug() << "avant";

    // Créer un mapper pour l'image
    vtkSmartPointer<vtkImageMapper3D> mapper = vtkImageMapper3D::New();
    mapper->SetInputData(imageData);

    qDebug() << "après";

    // Créer un acteur pour l'image
    vtkSmartPointer<vtkImageActor> actor = vtkSmartPointer<vtkImageActor>::New();
    actor->SetMapper(mapper);

    // Créer un renderer et ajouter l'acteur
    vtkSmartPointer<vtkRenderer> renderer = vtkSmartPointer<vtkRenderer>::New();
    renderer->AddActor(actor);

    // Créer un render window et ajouter le renderer
    vtkSmartPointer<vtkRenderWindow> renderWindow = vtkSmartPointer<vtkRenderWindow>::New();
    renderWindow->AddRenderer(renderer);
    renderWindow->SetWindowName("VisualizeImageData");

    // Créer un interactor et définir le render window
    vtkSmartPointer<vtkRenderWindowInteractor> renderWindowInteractor = vtkSmartPointer<vtkRenderWindowInteractor>::New();
    renderWindowInteractor->SetRenderWindow(renderWindow);

    // Afficher la fenêtre
    renderWindow->Render();
    renderWindowInteractor->Start();

    // LE CODE SUIVANT SERT A AFFICHER LE CUBE (CA FONCTIONNE)

    /*vtkNew<vtkNamedColors> colors;

    // Create an image data
    vtkNew<vtkImageData> imageData;

    // Specify the size of the image data
    imageData->SetDimensions(3, 3, 2);
    imageData->SetSpacing(1.0, 1.0, 1.0);
    imageData->SetOrigin(0.0, 0.0, 0.0);

    vtkNew<vtkDataSetMapper> mapper;
    mapper->SetInputData(imageData);

    vtkNew<vtkActor> actor;
    actor->SetMapper(mapper);
    actor->GetProperty()->SetColor(colors->GetColor3d("MistyRose").GetData());

    vtkNew<vtkRenderWindow> renderWindow;

    vtkNew<vtkRenderer> renderer;

    // Add both renderers to the window
    renderWindow->AddRenderer(renderer);
    renderWindow->SetWindowName("VisualizeImageData");

    // Add a sphere to the left and a cube to the right
    renderer->AddActor(actor);
    renderer->SetBackground(colors->GetColor3d("SlateGray").GetData());

    renderWindow->Render();
    renderer->GetActiveCamera()->Azimuth(-30);
    renderer->GetActiveCamera()->Elevation(30);
    renderer->ResetCamera();

    vtkNew<vtkRenderWindowInteractor> renderWindowInteractor;
    renderWindowInteractor->SetRenderWindow(renderWindow);
    renderWindow->Render();
    renderWindowInteractor->Start();*/
}

