# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Users/salim/Desktop/PFE/M2/3d-nii-visualizer/venv/lib/python3.9/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /Users/salim/Desktop/PFE/M2/3d-nii-visualizer/venv/lib/python3.9/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv

# Include any dependencies generated for this target.
include samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/compiler_depend.make

# Include the progress variables for this target.
include samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/progress.make

# Include the compile flags for this target's objects.
include samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/flags.make

samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o: samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/flags.make
samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o: /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp
samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o: samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o -MF CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o.d -o CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o -c /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp

samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.i"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp > CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.i

samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.s"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp -o CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.s

# Object files for target example_tutorial_introduction_to_svm
example_tutorial_introduction_to_svm_OBJECTS = \
"CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o"

# External object files for target example_tutorial_introduction_to_svm
example_tutorial_introduction_to_svm_EXTERNAL_OBJECTS =

bin/example_tutorial_introduction_to_svm: samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/tutorial_code/ml/introduction_to_svm/introduction_to_svm.cpp.o
bin/example_tutorial_introduction_to_svm: samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/build.make
bin/example_tutorial_introduction_to_svm: lib/libopencv_gapi.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_highgui.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_ml.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_objdetect.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_photo.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_stitching.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_video.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_videoio.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_imgcodecs.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_calib3d.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_features2d.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_flann.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_dnn.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_imgproc.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: lib/libopencv_core.4.9.0.dylib
bin/example_tutorial_introduction_to_svm: samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_tutorial_introduction_to_svm"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_tutorial_introduction_to_svm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/build: bin/example_tutorial_introduction_to_svm
.PHONY : samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/build

samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/clean:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && $(CMAKE_COMMAND) -P CMakeFiles/example_tutorial_introduction_to_svm.dir/cmake_clean.cmake
.PHONY : samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/clean

samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/depend:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : samples/cpp/CMakeFiles/example_tutorial_introduction_to_svm.dir/depend

