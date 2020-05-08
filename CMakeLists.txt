cmake_minimum_required(VERSION 3.8)

# ---- Project ----

project(EXAMPLE VERSION 1.2.3.4 LANGUAGES CXX)
set(LIBRARY_NAME example)
set(PROJECT_CXX_STANDARD 17)

# ---- Options ----

# Options: Things you can set via commandline options to cmake (e.g. -DENABLE_COVERAGE=[ON|OFF])
option(ENABLE_WARNINGS_SETTINGS "Allow target_set_warnings to add flags and defines.
                                 Set this to OFF if you want to provide your own warning parameters." ON)
option(ENABLE_COVERAGE "Generates the coverage build" OFF)
option(ENABLE_TESTING "Whether to generate unit test program and test" ON)

# ---- Add source files ----
file(GLOB_RECURSE PROJECT_SOURCES "${CMAKE_SOURCE_DIR}/src/*.cc")
file(GLOB_RECURSE PROJECT_HEADERS "${CMAKE_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE PROJECT_ALL_FILES "include/*.h" "src/*.cc" "app/*.cc" "tests/*.cc")

# ---- Tool ----
file(GLOB_RECURSE PROJECT_MODULES "${CMAKE_SOURCE_DIR}/cmake/*.cmake")
foreach(ARG ${PROJECT_MODULES})
  include(${ARG})
endforeach()

# ---- Conan package ----
if(CONAN_EXPORTED)
    include(${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo.cmake)
    conan_basic_setup()
else()
    include("${CMAKE_SOURCE_DIR}/cmake/manual/conan.cmake")
    conan_cmake_run(CONANFILE conanfile.txt BASIC_SETUP)
endif()

# ---- Test coverage ----
if(ENABLE_COVERAGE)
    setup_coverage()
endif()

# ---- Create library ----
add_library(${LIBRARY_NAME} OBJECT ${PROJECT_SOURCES})

# Lib needs its header files, and users of the library must also see these (PUBLIC).
target_include_directories(${LIBRARY_NAME} PUBLIC ${PROJECT_SOURCE_DIR})
target_include_directories(${LIBRARY_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)

target_set_warnings(${LIBRARY_NAME} ENABLE ALL AS_ERROR ALL DISABLE Annoying)

# ---- Create Entry Point ----

# Add an executable for the file app/main.cc.
# If you add more executables, copy these lines accordingly.
add_executable(main app/main.cc)

# Link the executable to library.
target_link_libraries(main PRIVATE ${LIBRARY_NAME} ${CONAN_LIBS})

target_set_warnings(main ENABLE ALL AS_ERROR ALL DISABLE Annoying)

# Set the properties you require, e.g. what C++ standard to use. Here applied to library and main.
set_target_properties(
    ${LIBRARY_NAME} main 
      PROPERTIES 
        CXX_STANDARD ${PROJECT_CXX_STANDARD} 
        CXX_STANDARD_REQUIRED YES 
        CXX_EXTENSIONS NO
)

# Set up tests (see tests/CMakeLists.txt).
if(ENABLE_TESTING)
  enable_testing()
  add_subdirectory(tests)
endif()