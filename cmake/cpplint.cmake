find_program(CPPLINT cpplint)
if (CPPLINT)
    add_custom_target(
            cpplint ALL
            COMMAND cpplint
            ${PROJECT_ALL_FILES}
    )
endif ()