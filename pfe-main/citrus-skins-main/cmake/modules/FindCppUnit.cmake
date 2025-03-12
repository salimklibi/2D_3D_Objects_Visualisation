# Olivier

# - Try to find the libcppunit libraries
# Once done this will define
#
# CppUnit_FOUND - system has libcppunit
# CppUnit_INCLUDE_DIRS - the libcppunit include directory
# CppUnit_LIBRARIES - libcppunit library
# --


IF(CppUnit_FOUND)
   # in cache already
   SET(CppUnit_FIND_QUIETLY TRUE)
ENDIF()



FIND_PROGRAM(CppUnit_CONFIG_EXECUTABLE cppunit-config )

IF(NOT CppUnit_FOUND)

    SET(CppUnit_INCLUDE_DIRS)
    SET(CppUnit_LIBRARIES)

    IF(CppUnit_CONFIG_EXECUTABLE)
        #MESSAGE (STATUS "cppunit-config trouve")
        EXEC_PROGRAM(${CppUnit_CONFIG_EXECUTABLE} ARGS --cflags RETURN_VALUE _return_VALUE OUTPUT_VARIABLE CppUnit_CFLAGS)
        EXEC_PROGRAM(${CppUnit_CONFIG_EXECUTABLE} ARGS --libs RETURN_VALUE _return_VALUE OUTPUT_VARIABLE CppUnit_LIBRARIES)
        EXEC_PROGRAM(${CppUnit_CONFIG_EXECUTABLE} ARGS --version RETURN_VALUE _return_VALUE OUTPUT_VARIABLE CppUnit_INSTALLED_VERSION)
        STRING(REGEX REPLACE "-I(.+)" "\\1" CppUnit_CFLAGS "${CppUnit_CFLAGS}")
    ELSE(CppUnit_CONFIG_EXECUTABLE)
        #MESSAGE (STATUS "cppunit-config pas trouve")
        FIND_PATH(CppUnit_CFLAGS cppunit/TestRunner.h PATHS /usr/include /usr/local/include )
        FIND_LIBRARY(CppUnit_LIBRARIES NAMES cppunit PATHS /usr/lib /usr/local/lib )
    ENDIF(CppUnit_CONFIG_EXECUTABLE)

    SET(CppUnit_INCLUDE_DIRS ${CppUnit_CFLAGS} "${CppUnit_CFLAGS}/cppunit" CACHE INTERNAL "")
    SET(CppUnit_LIBRARIES ${CppUnit_LIBRARIES} CACHE INTERNAL "")

ENDIF()

IF(CppUnit_INCLUDE_DIRS AND CppUnit_LIBRARIES)

  SET(CppUnit_FOUND TRUE)
#  SET(CppUnit_FOUND TRUE CACHE INTERNAL "")

  IF(CppUnit_CONFIG_EXECUTABLE)
    EXEC_PROGRAM(${CppUnit_CONFIG_EXECUTABLE} ARGS --version RETURN_VALUE _return_VALUE OUTPUT_VARIABLE CppUnit_INSTALLED_VERSION)
  ENDIF(CppUnit_CONFIG_EXECUTABLE)

  #macro_ensure_version( ${CppUnit_MIN_VERSION} ${CppUnit_INSTALLED_VERSION} CppUnit_INSTALLED_VERSION_OK )


ELSE(CppUnit_INCLUDE_DIRS AND CppUnit_LIBRARIES)

  SET(CppUnit_FOUND FALSE)
#  SET(CppUnit_FOUND FALSE CACHE BOOL "Not found cppunit library")

ENDIF(CppUnit_INCLUDE_DIRS AND CppUnit_LIBRARIES)

MARK_AS_ADVANCED(CppUnit_INCLUDE_DIRS CppUnit_LIBRARIES)

MESSAGE("CppUnit    [${CppUnit_LIBRARIES}] [${CppUnit_INCLUDE_DIRS}]"
)

