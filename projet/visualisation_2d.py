import vtk

def visualize_2d(image_data):
    # Créer un mapper pour la visualisation 2D
    image_mapper = vtk.vtkImageMapper()
    image_mapper.SetInputData(image_data)
    
    # Créer un acteur pour la visualisation 2D
    image_actor = vtk.vtkActor2D()
    image_actor.SetMapper(image_mapper)
    
    return image_actor
