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

# Utility rule file for opencv_tests.

# Include any custom commands dependencies for this target.
include CMakeFiles/opencv_tests.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/opencv_tests.dir/progress.make

opencv_tests: CMakeFiles/opencv_tests.dir/build.make
.PHONY : opencv_tests

# Rule to build all files generated by this target.
CMakeFiles/opencv_tests.dir/build: opencv_tests
.PHONY : CMakeFiles/opencv_tests.dir/build

CMakeFiles/opencv_tests.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/opencv_tests.dir/cmake_clean.cmake
.PHONY : CMakeFiles/opencv_tests.dir/clean

CMakeFiles/opencv_tests.dir/depend:
	cd /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv /Users/salim/Desktop/PFE/M2/pfe-main/citrus-skins-main/cmake/build_opencv/CMakeFiles/opencv_tests.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/opencv_tests.dir/depend

