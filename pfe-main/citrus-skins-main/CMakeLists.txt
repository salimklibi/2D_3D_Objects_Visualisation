cmake_minimum_required (VERSION 3.5)
project(citrus-skins)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(
    CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/cmake/modules"
)

# rechercher opencv
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

# Rechercher la bibliothèque Qt5
find_package(Qt5 COMPONENTS Widgets Gui REQUIRED)

# Rechercher la bibliothèque Qt6
#find_package(Qt6 COMPONENTS Widgets Gui REQUIRED)

# Rechercher la bibliothèque ImageMagick
find_package(ImageMagick COMPONENTS Magick++ REQUIRED)

# Rechercher la bibliothèque CppUnit
find_package(CppUnit REQUIRED)
include_directories(${CppUnit_INCLUDE_DIRS})

# Rechercher la bibliothèque itk
list(APPEND CMAKE_PREFIX_PATH "/net/cremi/jchaveroux/espaces/travail/Travail/M2/PFE/ITK/ITK-build") # attention à modifier pour chaque ordinateur
find_package(ITK REQUIRED)
include(${ITK_USE_FILE})
message("ITK_USE_FILE : ${ITK_USE_FILE}")
message("CMAKE_PREFIX_PATH : ${CMAKE_PREFIX_PATH}")
#message("ITK_INCLUDE_DIRS : ${ITK_INCLUDE_DIRS}")
message("ITK_LIBRARY_DIRS : ${ITK_LIBRARY_DIRS}")

list(APPEND CMAKE_PREFIX_PATH "/net/cremi/jchaveroux/espaces/travail/Travail/M2/PFE/VTK/VTK-build") # attention à modifier pour chaque ordinateur
find_package(VTK REQUIRED)

#file(GLOB SOURCES src/*.cpp src/gui/*.cpp src/toolbox/*.cpp)
#file(GLOB HEADERS src/*.h src/gui/*.h src/toolbox/*.h)
#file(GLOB SOURCES_TEST tests/*.cpp tests/gui/*.cpp  src/gui/*.cpp src/toolbox/*.cpp)
#file(GLOB HEADERS_TEST tests/*.h tests/gui/*.h  src/gui/*.h src/toolbox/*.h)
file(GLOB SOURCES src/*.cpp src/gui/*.cpp src/toolbox/ToolImage.cpp)
file(GLOB HEADERS src/*.h src/gui/*.h src/toolbox/ToolImage.h)
file(GLOB SOURCES_TEST tests/*.cpp tests/gui/*.cpp  src/gui/*.cpp src/toolbox/ToolImage.cpp)
file(GLOB HEADERS_TEST tests/*.h tests/gui/*.h  src/gui/*.h src/toolbox/ToolImage.h)

include_directories(${ImageMagick_INCLUDE_DIRS})

add_executable(citrus-skins ${SOURCES} ${HEADERS})
add_executable(testCitrus  ${SOURCES_TEST} ${HEADERS_TEST})
target_include_directories(testCitrus PRIVATE src)

#target_link_libraries(citrus-skins Qt5::Widgets Qt5::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES})
target_link_libraries(citrus-skins Qt5::Widgets Qt5::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${ITK_LIBRARIES} ${VTK_LIBRARIES})
#target_link_libraries(citrus-skins Qt6::Widgets Qt6::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES})
#target_link_libraries(citrus-skins Qt6::Widgets Qt6::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${ITK_LIBRARIES})
target_link_libraries(testCitrus  Qt5::Widgets Qt5::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${CppUnit_LIBRARIES} ${VTK_LIBRARIES})
#target_link_libraries(testCitrus  Qt5::Widgets Qt5::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${CppUnit_LIBRARIES} ${ITK_LIBRARIES})
#target_link_libraries(testCitrus  Qt6::Widgets Qt6::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${CppUnit_LIBRARIES})
#target_link_libraries(testCitrus  Qt6::Widgets Qt6::Gui ${OpenCV_LIBS} ${ImageMagick_LIBRARIES} ${CppUnit_LIBRARIES} ${ITK_LIBRARIES})

vtk_module_autoinit(
  TARGETS citrus-skins
  MODULES ${VTK_LIBRARIES}
)

# pour exécuter les tests avec "make testCitrus"
add_test(NAME testCitrus COMMAND testCitrus)
