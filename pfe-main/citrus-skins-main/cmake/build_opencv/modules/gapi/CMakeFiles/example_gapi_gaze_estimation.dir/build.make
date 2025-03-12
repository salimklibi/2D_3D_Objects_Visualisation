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
include modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/compiler_depend.make

# Include the progress variables for this target.
include modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/progress.make

# Include the compile flags for this target's objects.
include modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/flags.make

modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o: modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/flags.make
modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o: /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/modules/gapi/samples/gaze_estimation.cpp
modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o: modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o -MF CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o.d -o CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o -c /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/modules/gapi/samples/gaze_estimation.cpp

modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.i"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/modules/gapi/samples/gaze_estimation.cpp > CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.i

modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.s"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/modules/gapi/samples/gaze_estimation.cpp -o CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.s

# Object files for target example_gapi_gaze_estimation
example_gapi_gaze_estimation_OBJECTS = \
"CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o"

# External object files for target example_gapi_gaze_estimation
example_gapi_gaze_estimation_EXTERNAL_OBJECTS =

bin/example_gapi_gaze_estimation: modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/samples/gaze_estimation.cpp.o
bin/example_gapi_gaze_estimation: modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/build.make
bin/example_gapi_gaze_estimation: lib/libopencv_gapi.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_video.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_highgui.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_dnn.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_calib3d.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_features2d.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_flann.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_videoio.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_imgcodecs.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_imgproc.4.9.0.dylib
bin/example_gapi_gaze_estimation: lib/libopencv_core.4.9.0.dylib
bin/example_gapi_gaze_estimation: modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_gapi_gaze_estimation"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_gapi_gaze_estimation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/build: bin/example_gapi_gaze_estimation
.PHONY : modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/build

modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/clean:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi && $(CMAKE_COMMAND) -P CMakeFiles/example_gapi_gaze_estimation.dir/cmake_clean.cmake
.PHONY : modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/clean

modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/depend:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/modules/gapi /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : modules/gapi/CMakeFiles/example_gapi_gaze_estimation.dir/depend

