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
include samples/tapi/CMakeFiles/example_tapi_camshift.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include samples/tapi/CMakeFiles/example_tapi_camshift.dir/compiler_depend.make

# Include the progress variables for this target.
include samples/tapi/CMakeFiles/example_tapi_camshift.dir/progress.make

# Include the compile flags for this target's objects.
include samples/tapi/CMakeFiles/example_tapi_camshift.dir/flags.make

samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o: samples/tapi/CMakeFiles/example_tapi_camshift.dir/flags.make
samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o: /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/tapi/camshift.cpp
samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o: samples/tapi/CMakeFiles/example_tapi_camshift.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o -MF CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o.d -o CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o -c /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/tapi/camshift.cpp

samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/example_tapi_camshift.dir/camshift.cpp.i"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/tapi/camshift.cpp > CMakeFiles/example_tapi_camshift.dir/camshift.cpp.i

samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/example_tapi_camshift.dir/camshift.cpp.s"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/tapi/camshift.cpp -o CMakeFiles/example_tapi_camshift.dir/camshift.cpp.s

# Object files for target example_tapi_camshift
example_tapi_camshift_OBJECTS = \
"CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o"

# External object files for target example_tapi_camshift
example_tapi_camshift_EXTERNAL_OBJECTS =

bin/example_tapi_camshift: samples/tapi/CMakeFiles/example_tapi_camshift.dir/camshift.cpp.o
bin/example_tapi_camshift: samples/tapi/CMakeFiles/example_tapi_camshift.dir/build.make
bin/example_tapi_camshift: lib/libopencv_video.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_highgui.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_objdetect.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_calib3d.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_videoio.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_imgcodecs.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_features2d.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_flann.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_dnn.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_imgproc.4.9.0.dylib
bin/example_tapi_camshift: lib/libopencv_core.4.9.0.dylib
bin/example_tapi_camshift: samples/tapi/CMakeFiles/example_tapi_camshift.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_tapi_camshift"
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_tapi_camshift.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/tapi/CMakeFiles/example_tapi_camshift.dir/build: bin/example_tapi_camshift
.PHONY : samples/tapi/CMakeFiles/example_tapi_camshift.dir/build

samples/tapi/CMakeFiles/example_tapi_camshift.dir/clean:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi && $(CMAKE_COMMAND) -P CMakeFiles/example_tapi_camshift.dir/cmake_clean.cmake
.PHONY : samples/tapi/CMakeFiles/example_tapi_camshift.dir/clean

samples/tapi/CMakeFiles/example_tapi_camshift.dir/depend:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv/samples/tapi /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/samples/tapi/CMakeFiles/example_tapi_camshift.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : samples/tapi/CMakeFiles/example_tapi_camshift.dir/depend

