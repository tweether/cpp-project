cmake_minimum_required(VERSION 3.8)

# ---- Project ----
set(TEST_MAIN ${PROJECT_NAME}.tests)
set(TEST_RUNNER_PARAMS "")

# ---- Add source files ----
file(GLOB_RECURSE PROJECT_TEST_SOURCES "${CMAKE_SOURCE_DIR}/tests/*.cc")

# ---- Create Entry Point ----
add_executable(${TEST_MAIN} ${PROJECT_TEST_SOURCES})

# Link the executable to library.
target_link_libraries(${TEST_MAIN} PRIVATE ${LIBRARY_NAME} ${CONAN_LIBS})

target_set_warnings(${TEST_MAIN} ENABLE ALL AS_ERROR ALL DISABLE Annoying)

set_target_properties(${TEST_MAIN} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}
    CXX_STANDARD ${PROJECT_CXX_STANDARD} 
    CXX_STANDARD_REQUIRED YES 
    CXX_EXTENSIONS NO
)

# add in ctest
add_test(
    # Use some per-module/project prefix so that it is easier to run only tests for this module
    NAME ${LIBRARY_NAME}.${TEST_MAIN}
    COMMAND ${TEST_MAIN} ${TEST_RUNNER_PARAMS})

# ---- Code coverage ----
if(ENABLE_COVERAGE)
    setup_target_for_coverage_lcov(
        NAME coverage
        EXECUTABLE ctest
        EXCLUDE
            "${PROJECT_SOURCE_DIR}/tests/*"
            "${PROJECT_SOURCE_DIR}/externals/*"
            "${PROJECT_SOURCE_DIR}/vendor/*"
            "/*/.conan/*"
            "/usr/*"
            "/opt/*")
endif()