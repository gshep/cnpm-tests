file(
    REMOVE_RECURSE
    ${PROJECT_BINARY_DIR}/extractExistingPackage
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/extractExistingPackage
)

file(
    MAKE_DIRECTORY
    ${PROJECT_BINARY_DIR}/extractExistingPackage/111
)

file(
    COPY
        ${PROJECT_SOURCE_DIR}/defaultUrlList/test/qt-5.9.6-amd64-4.7z
    DESTINATION
        ${PROJECT_BINARY_DIR}/extractExistingPackage/111
)

execute_process(
    COMMAND
        ${CMAKE_COMMAND}
        -G
        ${CMAKE_GENERATOR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DCNPM_SOURCE_ROOT=${CNPM_SOURCE_ROOT}
        ${PROJECT_SOURCE_DIR}/extractExistingPackage
    WORKING_DIRECTORY
        ${PROJECT_BINARY_DIR}/extractExistingPackage
    RESULT_VARIABLE
        EXTRACTING_STATUS
)

if(NOT EXTRACTING_STATUS EQUAL 0)
    message(
        FATAL_ERROR
        "extractExistingPackage failed"
    )
endif()
