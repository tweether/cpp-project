# Replace template file
file(GLOB_RECURSE PROJECT_HEADER_CONFIGS "${CMAKE_SOURCE_DIR}/include/*.h.in")

foreach(ARG ${PROJECT_HEADER_CONFIGS})
  string(REGEX REPLACE "\.in$" "" NEW_FILE ${ARG})
  string(REGEX REPLACE "^${CMAKE_SOURCE_DIR}" ${PROJECT_BINARY_DIR} NEW_FILE ${NEW_FILE})
  configure_file(${ARG} ${NEW_FILE})
endforeach()

# Add the binary tree to the search path for include files
include_directories("${PROJECT_BINARY_DIR}/include")

# Ask CMake to output a compile_commands.json file for use with things like Vim YCM.
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)