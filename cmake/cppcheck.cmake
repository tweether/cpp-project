find_program(CPPCHECK cppcheck)
if (CPPCHECK)
    add_custom_target(
            cppcheck
            COMMAND ${CPPCHECK}
            --quiet
            --error-exitcode=1
            --enable=warning,portability,performance,style
            --std=c++${PROJECT_CXX_STANDARD}
            -I ${PROJECT_ALL_FILES}
    )
endif ()