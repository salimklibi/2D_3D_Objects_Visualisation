#include <iostream>

#include "ToolImage3D.h"

#include "itkImage.h"
#include "itkImageSeriesReader.h"
#include "itkImageFileWriter.h"
#include "itkNumericSeriesFileNames.h"


using namespace itk;

/**ToolImage::ToolImage() {

}*/


int ToolImage3D::convert3D(int begin, int end, std::string inputdirectory, std::string outputfilename, std::string pattern) {
  using PixelType = unsigned char;
  constexpr unsigned int Dimension = 3;

  using ImageType = itk::Image<PixelType, Dimension>;
  using ReaderType = itk::ImageSeriesReader<ImageType>;

  auto reader = ReaderType::New();

  using NameGeneratorType = itk::NumericSeriesFileNames;

  auto nameGenerator = NameGeneratorType::New();

  nameGenerator->SetSeriesFormat(pattern); // ex: 0132 pour l'ordre des fichiers (%dddd)
  nameGenerator->SetStartIndex(begin);
  nameGenerator->SetEndIndex(end);
  nameGenerator->SetIncrementIndex(1);
  std::vector<std::string> names = nameGenerator->GetFileNames();

  // List the files
  //
  std::vector<std::string>::iterator nit;
  for (nit = names.begin(); nit != names.end(); ++nit)
  {
    std::cout << "File: " << (*nit).c_str() << std::endl;
  }

  reader->SetFileNames(names);

  try
  {
    itk::WriteImage(reader->GetOutput(), outputfilename);
  }
  catch (const itk::ExceptionObject & err)
  {
    std::cerr << "ExceptionObject caught !" << std::endl;
    std::cerr << err << std::endl;
    return EXIT_FAILURE;
  }

    return 0;
}
