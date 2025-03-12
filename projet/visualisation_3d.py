import vtk

def visualize_3d(image_data):
    # Créer un mapper pour la visualisation 3D
    volume_mapper = vtk.vtkSmartVolumeMapper()
    volume_mapper.SetInputData(image_data)
    
    # Créer un volume actor pour la visualisation 3D
    volume_actor = vtk.vtkVolume()
    volume_actor.SetMapper(volume_mapper)
    
    return volume_actor
