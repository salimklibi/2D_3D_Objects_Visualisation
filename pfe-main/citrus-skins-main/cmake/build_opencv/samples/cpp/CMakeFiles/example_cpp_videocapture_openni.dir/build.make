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
include samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/compiler_depend.make

# Include the progress variables for this target.
include samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/progress.make

# Include the compile flags for this target's objects.
include samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/flags.make

samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o: samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/flags.make
samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o: /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/videocapture_openni.cpp
samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o: samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o -MF CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o.d -o CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o -c /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/videocapture_openni.cpp

samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.i"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/videocapture_openni.cpp > CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.i

samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.s"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp/videocapture_openni.cpp -o CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.s

# Object files for target example_cpp_videocapture_openni
example_cpp_videocapture_openni_OBJECTS = \
"CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o"

# External object files for target example_cpp_videocapture_openni
example_cpp_videocapture_openni_EXTERNAL_OBJECTS =

bin/example_cpp_videocapture_openni: samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/videocapture_openni.cpp.o
bin/example_cpp_videocapture_openni: samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/build.make
bin/example_cpp_videocapture_openni: lib/libopencv_gapi.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_highgui.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_ml.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_objdetect.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_photo.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_stitching.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_video.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_videoio.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_imgcodecs.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_calib3d.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_features2d.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_flann.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_dnn.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_imgproc.4.9.0.dylib
bin/example_cpp_videocapture_openni: lib/libopencv_core.4.9.0.dylib
bin/example_cpp_videocapture_openni: samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_cpp_videocapture_openni"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_cpp_videocapture_openni.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/build: bin/example_cpp_videocapture_openni
.PHONY : samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/build

samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/clean:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp && $(CMAKE_COMMAND) -P CMakeFiles/example_cpp_videocapture_openni.dir/cmake_clean.cmake
.PHONY : samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/clean

samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/depend:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/cpp /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : samples/cpp/CMakeFiles/example_cpp_videocapture_openni.dir/depend

