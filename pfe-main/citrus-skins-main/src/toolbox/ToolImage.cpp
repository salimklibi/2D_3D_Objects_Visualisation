#include <iostream>

#include "ToolImage.h"
#include <Magick++.h>
#include <opencv2/opencv.hpp>
//#include "itkImage.h"
//#include "itkImageSeriesReader.h"
//#include "itkImageFileWriter.h"
//#include "itkNumericSeriesFileNames.h"


using namespace Magick;

/**ToolImage::ToolImage() {

}*/

int ToolImage::display(const std::string filename) {
  Image image;
  try {
    image.read(filename);
    image.display();
  }
  catch(Exception &error_ )
    {
     //std:: cout << "Caught exception: " << error_.what() << std::endl;
     return -1;
    }
    return 0;
}

int ToolImage::convert(std::string inputfilename, std::string outputfilename,  std::string size) {
    Image image;
    contours();
    try {
        image.read(inputfilename);
        image.resize(size + "x" + size);
        image.write(outputfilename);
        //std:: cout << " ToolImage::convert inputfilename " << inputfilename << std::endl;
        //std:: cout << " ToolImage::convert outputfilename " << outputfilename << std::endl;

    }
    catch(Exception &error_ )
    {
     //std:: cout << "Caught exception: " << error_.what() << std::endl;
     return -1;
    }
    return 0;
}

int ToolImage::contours(){
    std:: cout << "-------------- DEBUT CONTOUR --------------" << std::endl;
    cv::Mat image = cv::imread("../1.412um_pamplemousse2_pag_0424.tiff",cv::IMREAD_COLOR);

    if (image.empty()) {
        std::cerr << "Impossible de charger l'image." << std::endl;
        return -1;
    }

    // Convertir en niveaux de gris
    cv::Mat gray;
    cv::cvtColor(image, gray, cv::COLOR_BGR2GRAY);

    // Détection des contours avec Canny
    cv::Mat edges;
    cv::Canny(gray, edges, 0, 1);

    // Dilatation des contours pour les rendre plus visibles
    cv::Mat dilated_edges;
    cv::dilate(edges, dilated_edges, cv::Mat(), cv::Point(-1,-1), 0);

    // Création d'un masque de contour
    cv::Mat contour_mask = dilated_edges.clone();

    // Appliquer le masque pour supprimer le fond
    image.setTo(cv::Scalar(255, 255, 255), contour_mask);

    // Enregistrer l'image résultante
    cv::imwrite("../image_sans_fond.png", image);

    std:: cout << "------------- FIN CONTOUR ----------------" << std::endl;

    return 0;
}
